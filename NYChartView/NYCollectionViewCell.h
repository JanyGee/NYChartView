//
//  NYCollectionViewCell.h
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYBarView.h"

@interface NYCollectionViewCell : UICollectionViewCell
@property (nonatomic ,strong) NYBarView *barView;
@property (nonatomic ,strong) UILabel *bottomLabel;

@end
