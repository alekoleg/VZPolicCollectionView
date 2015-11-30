//
//  VZAppCollectionCell.m
//  Example
//
//  Created by Oleg Alekseenko on 25/11/14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "VZAppCollectionCell.h"


NSString * const VZAppCollectionCellIdentifier = @"VZAppCollectionCellIdentifier";
CGSize const VZAppCollectionCellSize = { 85, 95 };

@interface VZAppCollectionCell ()
@property (nonatomic, strong) UIView *imageHolder;
@end

@implementation VZAppCollectionCell

- (instancetype)initWithDefaultSizes {
    return [self initWithFrame:CGRectMake(0, 0, VZAppCollectionCellSize.width, VZAppCollectionCellSize.height) reuseIdenstifier:VZPolicCollectionCellIdentifier];
}

- (id)initWithFrame:(CGRect)frame reuseIdenstifier:(NSString *)identifier {
    if (self = [super initWithFrame:frame reuseIdenstifier:identifier]) {
        [self setupImageView];
        [self setupLabel];
    }
    return self;
}

#pragma mark - Setup -

- (void)setupImageView {
    if (!_imageView) {
        
        _imageHolder = [[UIView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.width - 20)];
        _imageHolder.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _imageHolder.layer.shadowColor = [UIColor grayColor].CGColor;
        _imageHolder.layer.shadowOffset = CGSizeMake(0, 1);
        _imageHolder.layer.shadowRadius = 1.0;
        _imageHolder.layer.shadowOpacity = 0.7;
        [self addSubview:_imageHolder];
        
        _imageView = [[UIImageView alloc] initWithFrame:_imageHolder.bounds];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 12.0;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_imageHolder addSubview:_imageView];
    }
}

- (void)setupLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.frame = ({
            CGRect frame = _textLabel.frame;
            frame.origin.x = 10;
            frame.origin.y = self.imageView.frame.size.height + self.imageView.frame.origin.y + 5;
            frame.size.width = self.frame.size.width - 2 * frame.origin.x;
            frame.size.height = self.frame.size.height - frame.origin.y - 5;
            frame;
        });
        _textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
        _textLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        _textLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _textLabel.textAlignment = NSTextAlignmentCenter;
		_textLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_textLabel];
    }
}

@end
