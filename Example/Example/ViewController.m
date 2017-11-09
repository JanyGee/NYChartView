//
//  ViewController.m
//  Example
//
//  Created by jany on 17/11/9.
//  Copyright © 2017年 Jany. All rights reserved.
//

#import "ViewController.h"
#import "NYScrollChartView.h"

@interface ViewController ()
@property (nonatomic, strong)NYScrollChartView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    [self.view addSubview:self.myView];
    
    _myView.dataArr = @[@[@(212),@(22),@(111),@(33),@(55),@(66),@(212),@(22),@(212),@(212),@(212),@(66)],@[@"10/2",@"10/3",@"10/4",@"10/5",@"10/6",@"10/7",@"10/8",@"10/9",@"10/10",@"10/11",@"10/12",@"10/13"]];
}

- (NYScrollChartView *)myView
{
    if (!_myView) {
        _myView = [[NYScrollChartView alloc] initWithFrame:CGRectMake(0.f, 100.f, self.view.frame.size.width, 300)];
    }
    return _myView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
