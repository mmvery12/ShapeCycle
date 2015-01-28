//
//  ShapeCycleView.m
//  FrameWork
//
//  Created by liyuchang on 15-1-27.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import "ShapeCycleView.h"

@implementation ShapeCycleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        backgroundShapelayer = [CAShapeLayer layer];
        backgroundShapelayer.frame = self.bounds;
        backgroundShapelayer.strokeColor = [UIColor lightGrayColor].CGColor;
        [self.layer addSublayer:backgroundShapelayer];
        flowShapelayer = [CAShapeLayer layer];
        flowShapelayer.frame = self.bounds;
        flowShapelayer.strokeColor = [UIColor blackColor].CGColor;
        [self.layer addSublayer:flowShapelayer];
    }
    return self;
}

-(UIBezierPath *)pathRef:(CGFloat)percent
{
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2., self.frame.size.width/2.) radius:self.frame.size.width/ 2 startAngle:-M_PI_2 endAngle:percent-M_PI_2 clockwise:1];
}

-(void)didMoveToSuperview
{
    UIBezierPath *path = [self pathRef:2*M_PI];
    backgroundShapelayer.path = flowShapelayer.path = path.CGPath;
    backgroundShapelayer.lineWidth = flowShapelayer.lineWidth = 5.0f;
    backgroundShapelayer.fillColor = flowShapelayer.fillColor = nil;
    backgroundShapelayer.lineCap = flowShapelayer.lineCap = @"round";
    backgroundShapelayer.strokeStart = flowShapelayer.strokeStart = 0;
    backgroundShapelayer.strokeEnd = 1;
    flowShapelayer.strokeEnd = 0;
}

-(void)setFlowShapeStorkColor:(UIColor *)flowColor
{
    flowShapelayer.strokeColor = flowColor.CGColor;
}

-(void)setBackgroundShapeStorkColor:(UIColor *)backgroundColor
{
    backgroundShapelayer.strokeColor = backgroundColor.CGColor;
}

-(void)setFlowPercent:(CGFloat)flowPercent
{
    if (flowPercent==1) {
        if (_finished) _finished(self);
        return;
    }
    __weak CAShapeLayer *temp = flowShapelayer;
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        temp.strokeEnd = flowPercent;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dealloc
{
#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

@end
