//
//  VZPolicCollectionView.h
//  Vazhno
//
//  Created by Alekseenko Oleg on 18.04.14.
//  Copyright (c) 2014 boloid. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VZPolicCollectionView, VZPolicCollectionCell;
@protocol VZPolicCollectionViewDelegate <NSObject>

- (NSInteger)numberOfSectionInPolicCollectionView:(VZPolicCollectionView *)view;
- (VZPolicCollectionCell *)policCollectionView:(VZPolicCollectionView *)view cellAtIndex:(NSInteger)index;

@optional;
- (void)policCollectionView:(VZPolicCollectionView *)collectionView didTappedCell:(VZPolicCollectionCell *)cell atIndex:(NSInteger)index;

@end


@interface VZPolicCollectionView : UIView

@property (nonatomic, weak) IBOutlet id <VZPolicCollectionViewDelegate> delegate;

///ширина полисов
/// @defualt = 150
@property (nonatomic, assign) CGFloat sectionWidth;

- (void)reloadData;
- (VZPolicCollectionCell *)dequeCellWithIdentifier:(NSString *)identifier;

- (void)scrollToRightAnimated:(BOOL)animated;
@end
