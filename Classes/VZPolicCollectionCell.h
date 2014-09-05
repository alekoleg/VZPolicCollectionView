//
//  VZPolicCollectionCell.h
//  Example
//
//  Created by Alekseenko Oleg on 04.09.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VZPolicCollectionCell : UIView

@property (nonatomic, copy, readonly) NSString *reuseIdentifier;

- (id)initWithFrame:(CGRect)frame reuseIdenstifier:(NSString *)identifier;

@end
