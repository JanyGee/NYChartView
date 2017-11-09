//
//  NYScrollChartView.h
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ClickItemDelegate <NSObject>

@optional
- (void)selectedIndex:(NSInteger)index;

@end
@interface NYScrollChartView : UIView
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, weak)id<ClickItemDelegate>delegate;
@end

