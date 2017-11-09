//
//  NYBarView.h
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYBarView : UIView

@property (nonatomic, assign)CGFloat value;
@property (nonatomic, strong)UIColor *color;
@property (nonatomic, assign)CGFloat maxValue;

- (void)changeBarColor:(UIColor *)cClolor;
@end
