//
//  VZPolicCollectionView.m
//  Vazhno
//
//  Created by Alekseenko Oleg on 18.04.14.
//  Copyright (c) 2014 boloid. All rights reserved.
//

#import "VZPolicCollectionView.h"
#import "VZPolicCollectionCell.h"

@interface VZPolicCollectionView () <UIScrollViewDelegate> {
    NSMutableDictionary *_forReuseDic;
    NSMutableSet *_visibleCells;
    NSInteger _countOfCells;
    NSMutableDictionary *_nibMap;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@end



@implementation VZPolicCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}


#pragma mark - Setup -

- (void)setup {
    _forReuseDic = [NSMutableDictionary dictionary];
    _nibMap = [NSMutableDictionary dictionary];
    _visibleCells = [NSMutableSet set];
    _sectionWidth = 150;
    self.centerContent = NO;
    [self setupScrollView];
}

- (void)setupScrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _scrollView.alwaysBounceHorizontal = YES;
        [self addSubview:_scrollView];
    }
}


#pragma mark - Actions -

- (void)reloadData {
    _countOfCells = [_delegate numberOfSectionInPolicCollectionView:self];
    [self updateScrollViewContentSize];
    [self updateCellAfterReload:YES];
}

- (void)tappedCell:(UITapGestureRecognizer *)tap {
    if (tap.state == UIGestureRecognizerStateRecognized) {
        if ([_delegate respondsToSelector:@selector(policCollectionView:didTappedCell:atIndex:)]) {
            [_delegate policCollectionView:self didTappedCell:(VZPolicCollectionCell *)tap.view atIndex:tap.view.tag];
        }
    }
}

- (id)dequeCellWithIdentifier:(NSString *)identifier {
    NSMutableArray *array = _forReuseDic[identifier];
    VZPolicCollectionCell *cell = [array lastObject];
    [cell prepareForReuse];
    [array removeLastObject];
    if (!cell) {
        UINib *nib = _nibMap[identifier];
        cell = [[nib instantiateWithOwner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)scrollToRightAnimated:(BOOL)animated {
    [self.scrollView setContentOffset:CGPointMake(-self.scrollView.contentInset.left, self.scrollView.contentOffset.y) animated:animated];
}

- (void)registerNib:(UINib *)nib forIndentifier:(NSString *)identifier {
    _nibMap[identifier] = nib;
}

- (void)registerClass:(NSString *)className forIndentifier:(NSString *)identifier {
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    [self registerNib:nib forIndentifier:identifier];
}

- (void)setCenterContent:(BOOL)centerContent {
    _centerContent = centerContent;
    [self updateScrollViewContentSize];
}
#pragma mark - Helpers -

- (CGFloat)xOriginForIntex:(NSInteger)index {
    return _sectionWidth * index;
}

- (NSArray *)visibleIndexs {
    int min_index = floor(_scrollView.contentOffset.x / _sectionWidth);
    int max_index = ceil((_scrollView.contentOffset.x + _scrollView.frame.size.width) / _sectionWidth);
    
    NSMutableArray *visibleIndexs = [NSMutableArray array];
    for (int i = min_index; i <= max_index; i++) {
        [visibleIndexs addObject:@(i)];
    }
    return [visibleIndexs copy];
}

- (void)updateScrollViewContentSize {
    _scrollView.contentSize = CGSizeMake(_countOfCells * _sectionWidth, _scrollView.contentSize.height);
    float offsetX = (_scrollView.frame.size.width - _scrollView.contentSize.width) / 2 ;
    offsetX = MAX(offsetX, 0);
    _scrollView.contentInset = UIEdgeInsetsMake(0, offsetX * _centerContent, 0, 0);
}

- (void)addCellForReuse:(VZPolicCollectionCell *)cell {
    NSMutableArray *array = [_forReuseDic valueForKey:cell.reuseIdentifier];
    if (!array) {
        array = [NSMutableArray array];
        _forReuseDic[cell.reuseIdentifier] = array;
    }
    [array addObject:cell];
}

- (VZPolicCollectionCell *)cellWithIndex:(NSInteger)index {
    VZPolicCollectionCell *innerCell = nil;
    for (VZPolicCollectionCell *view in _scrollView.subviews) {
        if (view.tag == index) {
            innerCell = view;
            break;
        }
    }
    return innerCell;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateCellAfterReload:YES];
}

#pragma mark - ScrollViewDelegate -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateCellAfterReload:NO];
}

- (void)updateCellAfterReload:(BOOL)reload {
    
    NSArray *indexs = [self visibleIndexs];
    _visibleCells = [NSMutableSet set];
    for (NSNumber *idx in indexs) {
        if (idx.intValue >= 0 && idx.intValue < _countOfCells) {
            __block VZPolicCollectionCell *cell  =  [self cellWithIndex:idx.intValue];
            
            void (^setupCell)(void) = ^{
                cell = [_delegate policCollectionView:self cellAtIndex:idx.intValue];
                cell.frame = ({
                    CGRect frame = cell.frame;
                    frame.origin.x = [self xOriginForIntex:idx.intValue];
                    frame.size.width = _sectionWidth;
                    frame.size.height = self.frame.size.height;
                    frame;
                });
                cell.tag = idx.integerValue;
                if (cell.gestureRecognizers.count == 0) {
                    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCell:)];
                    [cell addGestureRecognizer:tap];
                }
                [_visibleCells addObject:cell];
                [_scrollView addSubview:cell];
            };
            
            if (!cell) {
                setupCell();
            } else {
                if (reload) {
                    [self addCellForReuse:cell];
                    [cell removeFromSuperview];
                    setupCell();
                } else {
                    [_visibleCells addObject:cell];
                }
            }
        }
    }
    
    [_scrollView.subviews enumerateObjectsUsingBlock:^(VZPolicCollectionCell * obj, NSUInteger idx, BOOL *stop) {
        if (![_visibleCells containsObject:obj]) {
            [obj removeFromSuperview];
            [self addCellForReuse:obj];
        }
    }];
}


@end
