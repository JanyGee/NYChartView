//
//  NYBarLayer.h
//  TestMyLayer
//
//  Created by jany on 17/11/6.
//  Copyright © 2017年 Jany. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface NYBarLayer : CAShapeLayer

- (instancetype)initWithStrokeWidth:(CGFloat)strokeWidth
             strokeColor:(UIColor *)strokeColor
               fillColor:(UIColor *)fillColor
       durationAnimation:(int)duration;
@end
