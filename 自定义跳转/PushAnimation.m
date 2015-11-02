//
//  PushAnimation.m
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "PushAnimation.h"

@implementation PushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 10;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *desController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *srcController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:desController.view];
    desController.view.alpha = 0.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         srcController.view.transform = CGAffineTransformMakeScale(-1.0, 1.0);
                         desController.view.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         srcController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
}



@end
