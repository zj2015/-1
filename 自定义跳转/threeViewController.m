//
//  threeViewController.m
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "threeViewController.h"

@interface threeViewController ()

@end

@implementation threeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(0, 0, 100, 100);
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{


    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
