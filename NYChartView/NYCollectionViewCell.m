//
//  NYCollectionViewCell.m
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import "NYCollectionViewCell.h"

@implementation NYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.barView];
        [self addSubview:self.bottomLabel];

    }
    return self;
}
#pragma mark==================================setup UI==================================
- (NYBarView *)barView
{
    if (!_barView) {
        _barView = [[NYBarView alloc] initWithFrame:CGRectMake(5.f, 5.f, self.frame.size.width - 10.f, self.frame.size.height - 30.f)];
        [_barView setBackgroundColor:[UIColor clearColor]];
        
    }
    return _barView;
}

- (UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, _barView.frame.size.height + 5.f, self.frame.size.width, self.frame.size.height - _barView.frame.size.height)];
        [_bottomLabel setBackgroundColor:[UIColor redColor]];
        [_bottomLabel setTextAlignment:NSTextAlignmentCenter];
        //[_bottomLabel setText:@"10/22"];
        [_bottomLabel setAdjustsFontSizeToFitWidth:YES];
    }
    return _bottomLabel;
}

@end
