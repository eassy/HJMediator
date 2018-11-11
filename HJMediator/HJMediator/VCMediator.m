//
//  VCMediator.m
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "VCMediator.h"

@interface VCMediator()

@property (nonatomic ,strong) UIViewController *targetVC;

@end

@implementation VCMediator

+ (instancetype)VCMediatorWithName:(NSString *)name parameters:(id)parameters
{
    NSString *actualMediatorClassName = [NSString stringWithFormat:@"Mediator%@",name];
    Class mediatorClass = NSClassFromString(actualMediatorClassName);
    VCMediator *mediator = [[mediatorClass alloc] init];
    
    UIViewController *vc = [mediator setTargetVCParameters:parameters];
    mediator.targetVC = vc;
    
    return mediator;
}

- (instancetype)initWithName:(NSString *)name parameters:(id)parametoers
{
    return [VCMediator VCMediatorWithName:name parameters:parametoers];
}

- (id)setTargetVCParameters:(id)parameters
{
    NSAssert(false, @"子类需要实现自己对应的初始化方法.");
    return nil;
}

- (void)targetPerformSelectorStr:(NSString *)selStr parameters:(id)parameters returnBlock:(id)returnBlock
{
    SEL selector = NSSelectorFromString(selStr);
    // 方法签名(方法的描述)
    NSMethodSignature *signature = [[self.targetVC class] instanceMethodSignatureForSelector:selector];
    if (signature == nil) {
        
        //可以抛出异常也可以不操作。
    }
    
    // NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = self.targetVC;
    invocation.selector = selector;
    
    // 设置参数
    NSInteger paramsCount = signature.numberOfArguments - 2; // 除self、_cmd以外的参数个数
    
    paramsCount = MIN(paramsCount, [((NSDictionary *)parameters) allKeys].count);
    for (NSInteger i = 0; i < paramsCount; i++) {
        id object = [((NSDictionary *)parameters) allValues][i];
//        if ([object isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&object atIndex:i + 2];
    }
    
    // 调用方法
    [invocation invoke];
    
    // 获取返回值
    id returnValue = nil;
    if (signature.methodReturnLength) { // 有返回值类型，才去获得返回值
        [invocation getReturnValue:&returnValue];
    }
    
}

@end
