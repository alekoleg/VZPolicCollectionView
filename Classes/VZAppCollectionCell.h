//
//  VZAppCollectionCell.h
//  Example
//
//  Created by Oleg Alekseenko on 25/11/14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "VZPolicCollectionCell.h"

extern NSString * const VZAppCollectionCellIdentifier;
extern CGSize const VZAppCollectionCellSize;

/**
 *  Usage: To display app info
 *  Description:
 */
@interface VZAppCollectionCell : VZPolicCollectionCell

@property (nonatomic, readonly) UIImageView *imageView;
@property (nonatomic, readonly) UILabel *textLabel;

- (instancetype)initWithDefaultSizes;

@end
