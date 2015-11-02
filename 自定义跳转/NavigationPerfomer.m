//
//  NavigationPerfomer.m
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "NavigationPerfomer.h"

@interface NavigationPerfomer()


@end

@implementation NavigationPerfomer

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        

        
    }
    
    return self;
}

- (void)initnav
{
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:panGesture];
    
    // 初始化动画方案
    self.pushAnimation = [[PushAnimation alloc] init];
    self.popAnimation  = [[PopAnimation alloc] init];

}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }
    else if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    
    return nil;



}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    return self.interactionController;
}


- (void)pan:(UIPanGestureRecognizer *)pan {
    UIView *view = self.navigationController.view;
    if (pan.state == UIGestureRecognizerStateBegan) { // 只有从左向右滑动的手势才作出响应：pop
        CGPoint location = [pan locationInView:view];
        if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    else if (pan.state == UIGestureRecognizerStateChanged) { // 以当前的位移作为进度执行动画
        CGPoint translation = [pan translationInView:view];
        CGFloat progress = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:progress];
    }
    else if (pan.state == UIGestureRecognizerStateEnded) {
        if ([pan velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        }
        else { // 如果手势的终点相对于起点在x正向上的位移小于0，即为取消手势
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil; // 最后必须将interactionController清空，确保不会影响到后面的动画执行
    }
}
@end
