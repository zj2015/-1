//
//  NavigationPerfomer.h
//  自定义跳转
//
//  Created by 张杰 on 15/11/2.
//  Copyright © 2015年 ZJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PushAnimation.h"
#import "PopAnimation.h"


@interface NavigationPerfomer : NSObject <UINavigationControllerDelegate>

@property (nonatomic, strong) UINavigationController *navigationController;

@property (strong, nonatomic) PushAnimation *pushAnimation;

@property (strong, nonatomic) PopAnimation *popAnimation;

@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactionController;

- (void)initnav;

@end
