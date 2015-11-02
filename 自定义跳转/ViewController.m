//
//  ViewController.m
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "ViewController.h"
#import "twoViewController.h"

@interface ViewController ()
{
    UINavigationController *nav;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
   
//     nav = [[UINavigationController alloc]initWithRootViewController:self];
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    [self transitionPush];
//    
//    twoViewController *cv = [[twoViewController alloc]init];
//    
//    [self.navigationController pushViewController:cv animated:YES];
//
//}

//-(void)transitionPush{
//    
//    
//    CATransition *tran = [CATransition animation];
//    
//    tran.duration = .5;
//    
//    
//    
//    tran.type = @"pageCurl";
//    
//    tran.subtype = kCATransitionFromRight;
//    
//    
//    
//    [self.navigationController.view.layer addAnimation:tran forKey:nil];
//    
//}

@end
