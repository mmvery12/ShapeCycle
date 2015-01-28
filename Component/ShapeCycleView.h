//
//  ShapeCycleView.h
//  FrameWork
//
//  Created by liyuchang on 15-1-27.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShapeCycleView;
typedef void (^FinsihBlock) (ShapeCycleView *share);
@interface ShapeCycleView : UIView
{
    CAShapeLayer *flowShapelayer;
    CAShapeLayer *backgroundShapelayer;
}
@property (nonatomic,copy)FinsihBlock finished;
@property (nonatomic,assign)CGFloat flowPercent;
@property (nonatomic,assign)UIColor *flowShapeStorkColor;
@property (nonatomic,assign)UIColor *backgroundShapeStorkColor;
@end
