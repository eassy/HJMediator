//
//  VCA.h
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "BaseVC.h"

@interface VCA : BaseVC

/**
 属性值
 */
@property (nonatomic ,assign) BOOL propertyA;

/**
 回调 可以通过 block 属性传入
 */
@property (nonatomic ,weak) id block1;

/**
 回调
 */
@property (nonatomic ,strong) id block2;

/**
 初始化方法

 @param name name
 @return isntance
 */
- (instancetype)initWithName:(NSString *)name;

/**
 有时候会有一些延时方法需要外界调用

 @param timeInterval 延时时间
 */
- (void)getDataAfterDelay:(NSNumber *)timeInterval sleepTime:(NSNumber *)sleepTime wakeBlock:(id)wakeBlock;

@end
