//
//  HJMediatorManager.h
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VCMediator.h"

@interface HJMediatorManager : NSObject


/**
 单例方法

 @return 单例
 */
+ (instancetype)shareManager;

/**
 push vc

 @param mediator mediator
 @param navController 导航 navController
 */
+ (void)pushVCWithMediator:(VCMediator *)mediator navController:(UINavigationController *)navController;

/**
 present vc

 @param mediator mediator
 @param mainController 主 vc
 */
+ (void)presentVCWithMediator:(VCMediator *)mediator mainController:(UIViewController *)mainController;



@end
