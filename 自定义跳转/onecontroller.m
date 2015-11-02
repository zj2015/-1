//
//  onecontroller.m
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import "onecontroller.h"

@interface onecontroller ()

@end

@implementation onecontroller

-(NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    return 2.0;
    
}


- (void)animateTransition:
(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    // 1. obtain state from the context
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    // 2. obtain the container view
    
    UIView *containerView = [transitionContext containerView];
    
    // 3. set initial state
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds]; toViewController.view.frame =
    
    CGRectOffset(finalFrame, 0, screenBounds.size.height); // 4. add the view
    
    [containerView addSubview:toViewController.view];
    
    // 5. animate
    
    NSTimeInterval duration =
    [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.frame = finalFrame; } completion:^(BOOL finished) {
            
            // 6. inform the context of completion
            
            [transitionContext completeTransition:YES]; 
            
        }];
    
}
@end
