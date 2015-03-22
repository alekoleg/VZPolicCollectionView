//
//  VZTestNibView.m
//  Example
//
//  Created by Alekseenko Oleg on 12.09.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "VZTestNibView.h"

@implementation VZTestNibView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.text = @"Test";
}

@end
