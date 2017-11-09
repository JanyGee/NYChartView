//
//  NYBarView.m
//  TestChart
//
//  Created by Jany on 2017/11/8.
//  Copyright © 2017年 MillionConcept. All rights reserved.
//

#import "NYBarView.h"
#import "NYBarLayer.h"

@interface NYBarView()

@property (nonatomic, strong)NYBarLayer *bLayer;
@end
@implementation NYBarView
@synthesize value = _value;
@synthesize color = _color;
@synthesize maxValue = _maxValue;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)changeBarColor:(UIColor *)cClolor
{
    [_bLayer setStrokeColor:cClolor.CGColor];
}

- (void)setValue:(CGFloat)value
{
    _value = value;
    [self setNeedsDisplay];
}
- (void)setColor:(UIColor *)color
{
    _color = color;
    [_bLayer setStrokeColor:_color.CGColor];
}
- (NYBarLayer *)bLayer
{
    if (!_bLayer) {
        _bLayer = [[NYBarLayer alloc]initWithStrokeWidth:self.frame.size.width
                                             strokeColor:_color
                                               fillColor:[UIColor clearColor]
                                       durationAnimation:1];
    }
    return _bLayer;
}
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *myPath = [UIBezierPath bezierPath];
    [myPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2,CGRectGetHeight(self.bounds))];
    [myPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2, CGRectGetMaxY(self.bounds) - _value * CGRectGetHeight(self.bounds) / _maxValue)];
    self.bLayer.path = myPath.CGPath;
    [self.bLayer addAnimation:[self generateAnimationWithKey:@"strokeEnd" duration:1] forKey:@"strokeEnd"];
    [self.layer insertSublayer:_bLayer above:self.layer];
}

- (CABasicAnimation *)generateAnimationWithKey:(NSString *)key duration:(int)duration{
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:key];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
    
    return pathAnimation;
}
@end

