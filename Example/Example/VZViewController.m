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

@interface VZViewController () <VZPolicCollectionViewDelegate>


@end

@implementation VZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    VZPolicCollectionView *view = [[VZPolicCollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMidY(self.view.bounds) - 100, self.view.frame.size.width, 200)];
    view.delegate = self;
    view.sectionWidth = 100;
    UINib *nib = [UINib nibWithNibName:@"VZTestNibView" bundle:nil];
    [view registerNib:nib forIndentifier:@"cellID"];
    [view reloadData];
    [self.view addSubview:view];
    

}


- (NSInteger)numberOfSectionInPolicCollectionView:(VZPolicCollectionView *)view {
    return 5;
}

- (VZPolicCollectionCell *)policCollectionView:(VZPolicCollectionView *)view cellAtIndex:(NSInteger)index {
    
    NSString * const cellID = @"cellID";
    
    VZPolicCollectionCell *cell = [view dequeCellWithIdentifier:cellID];
//    if (!cell) {
//        cell = [[VZPolicCollectionCell alloc] initWithFrame:CGRectMake(0, 0, 90, 200) reuseIdenstifier:cellID];
//    }
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
            break;
    }
    return cell;
}

@end
