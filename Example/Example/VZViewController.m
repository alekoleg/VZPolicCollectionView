//
//  VZViewController.m
//  Example
//
//  Created by Alekseenko Oleg on 04.09.14.
//  Copyright (c) 2014 alekoleg. All rights reserved.
//

#import "VZViewController.h"
#import "VZPolicCollectionCell.h"
#import "VZPolicCollectionView.h"
#import "VZAppCollectionCell.h"

@interface VZViewController () <VZPolicCollectionViewDelegate>


@end

@implementation VZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    VZPolicCollectionView *view = [[VZPolicCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds) - 100, self.view.frame.size.width, VZAppCollectionCellSize.height)];
    view.centerContent = YES;
    view.delegate = self;
    view.sectionWidth = 200;
    view.distanceBetweenCell = 15;
//    view.scrollView.contentInset = UIEdgeInsetsMake(0, 15, 0, 15);
//    UINib *nib = [UINib nibWithNibName:@"VZTestNibView" bundle:nil];
//    [view registerNib:nib forIndentifier:@"cellID"];

    [view reloadData];
    [self.view addSubview:view];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view scrollToIndex:@3 animated:YES];
    });

}


- (NSInteger)numberOfSectionInPolicCollectionView:(VZPolicCollectionView *)view {
    return 5;
}

- (VZPolicCollectionCell *)policCollectionView:(VZPolicCollectionView *)view cellAtIndex:(NSInteger)index {
    
    NSString * const cellID = @"cellID";
    
    VZPolicCollectionCell *cell = [view dequeCellWithIdentifier:VZPolicCollectionCellIdentifier];
    
//    if (!cell) {
//        cell = [[VZPolicCollectionCell alloc] init];
//    }
    
//    cell.textLabel.text = @"Text";
    if (!cell) {
        cell = [[VZPolicCollectionCell alloc] initWithFrame:CGRectMake(0, 0, 90, 200) reuseIdenstifier:cellID];
    }
    switch (index) {
        case 0:
            cell.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            cell.backgroundColor = [UIColor redColor];
            break;
        case 2:
            cell.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            cell.backgroundColor = [UIColor greenColor];
            break;
        case 4:
            cell.backgroundColor = [UIColor grayColor];
            break;
            
        default:
            cell.backgroundColor = [UIColor yellowColor];
            break;
    }
    return cell;
}

@end
