//
//  VCMediator.h
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VCMediator : NSObject

/**
 初始化类方法

 @param name 创建的 Mediator 后缀
 @param parameters 初始化参数 NSDictionary
 @return 具体的 mediator
 */
+ (instancetype)VCMediatorWithName:(NSString *)name parameters:(id)parameters;

/**
 初始化实例方法

 @param name 创建的 Mediator 后缀
 @param parametoers parameters 初始化参数 NSDictionary
 @return 具体的 mediator
 */
- (instancetype)initWithName:(NSString *)name parameters:(id)parametoers;


/**
 获取 mediator 中的 vc

 @return vc
 */
- (UIViewController *)targetVC;


/**
 对 vc 进行初始化具体方法，子类需要实现此方法，外界不需要手动调用，初始化 mediator 的时候会自动调用

 @param parameters 参数 NSDictionary
 @return 具体的 vc
 */
- (id)setTargetVCParameters:(id)parameters;

/**
 调用 vc 的方法

 @param selStr 方法名
 @param parameters 方法参数列表 NSDictionary
 @param returnBlock 回调 block
 */
- (void)targetPerformSelectorStr:(NSString *)selStr parameters:(id)parameters returnBlock:(id)returnBlock;

@end
