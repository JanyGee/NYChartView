//
//  NYBarLayer.m
//  TestMyLayer
//
//  Created by jany on 17/11/6.
//  Copyright © 2017年 Jany. All rights reserved.
//

#import "NYBarLayer.h"

@implementation NYBarLayer

- (instancetype)initWithStrokeWidth:(CGFloat)strokeWidth
                        strokeColor:(UIColor *)strokeColor
                          fillColor:(UIColor *)fillColor
                  durationAnimation:(int)duration
{
    
    self = [super init];
    
    if (self) {
        
        if ([self isKindOfClass:[NYBarLayer class]]) {
            
            NYBarLayer *pathLayer = (NYBarLayer *)self;
            pathLayer.strokeColor = [strokeColor CGColor];
            pathLayer.lineWidth = strokeWidth;
            pathLayer.lineCap = kCALineCapButt;
            pathLayer.lineJoin = kCALineJoinBevel;
            pathLayer.fillColor = [[UIColor clearColor]CGColor];
            
            [self addAnimation:[self generateAnimationWithKey:@"strokeEnd" duration:duration] forKey:@"strokeEnd"];
        }
    }
    return self;
}

- (CABasicAnimation *)generateAnimationWithKey:(NSString *)key duration:(int)duration{

    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:key];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
    
    return pathAnimation;
}
@end
