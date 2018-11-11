//
//  HJMediatorManager.m
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "HJMediatorManager.h"

@implementation HJMediatorManager

+ (instancetype)shareManager
{
    static  HJMediatorManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[HJMediatorManager alloc] init];
        //检查更新
    });
    return manager;
}

/**
 push vc
 
 @param mediator mediator
 @param navController 导航 navController
 */
+ (void)pushVCWithMediator:(VCMediator *)mediator navController:(UINavigationController *)navController
{
    /// 只是简单的 push ，实际开发过程中还可以添加其他逻辑
    [navController pushViewController:mediator.targetVC animated:YES];
}

/**
 present vc
 
 @param mediator mediator
 @param mainController 主 vc
 */
+ (void)presentVCWithMediator:(VCMediator *)mediator mainController:(UIViewController *)mainController
{
    /// 只是简单的 present ，实际开发过程中还可以添加其他逻辑
    [mainController presentViewController:mediator.targetVC animated:YES completion:nil];
}

@end
