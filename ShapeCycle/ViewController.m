//
//  ViewController.m
//  ShapeCycle
//
//  Created by liyuchang on 15-1-28.
//  Copyright (c) 2015年 com.Vacn. All rights reserved.
//

#import "ViewController.h"
#import "ShapeCycleView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ShapeCycleView *shape = [[ShapeCycleView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.view addSubview:shape];
    shape.center = self.view.center;
    shape.flowPercent = 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
