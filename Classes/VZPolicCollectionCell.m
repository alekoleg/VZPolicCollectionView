//
//  VZPolicCollectionCell.m
//  Example
//
//  Created by Alekseenko Oleg on 04.09.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "VZPolicCollectionCell.h"

@implementation VZPolicCollectionCell

- (id)initWithFrame:(CGRect)frame reuseIdenstifier:(NSString *)identifier
{
    self = [super initWithFrame:frame];
    if (self) {
        _reuseIdentifier = identifier;
    }
    return self;
}

@end