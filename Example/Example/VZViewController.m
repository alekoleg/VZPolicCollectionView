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
    view.sectionWidth = VZAppCollectionCellSize.width;
//    UINib *nib = [UINib nibWithNibName:@"VZTestNibView" bundle:nil];
//    [view registerNib:nib forIndentifier:@"cellID"];

    [view reloadData];
    [self.view addSubview:view];
    

}


- (NSInteger)numberOfSectionInPolicCollectionView:(VZPolicCollectionView *)view {
    return 2;
}

- (VZPolicCollectionCell *)policCollectionView:(VZPolicCollectionView *)view cellAtIndex:(NSInteger)index {
    
    NSString * const cellID = @"cellID";
    
    VZAppCollectionCell *cell = [view dequeCellWithIdentifier:VZAppCollectionCellIdentifier];
    
    if (!cell) {
        cell = [[VZAppCollectionCell alloc] initWithDefaultSizes];
    }
    
    cell.textLabel.text = @"Text";
//    if (!cell) {
//        cell = [[VZPolicCollectionCell alloc] initWithFrame:CGRectMake(0, 0, 90, 200) reuseIdenstifier:cellID];
//    }
    switch (index) {
        case 0:
            cell.imageView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            cell.imageView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            cell.imageView.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            cell.imageView.backgroundColor = [UIColor greenColor];
            break;
        case 4:
            cell.imageView.backgroundColor = [UIColor grayColor];
            break;
            
        default:
            break;
    }
    return cell;
}

@end
