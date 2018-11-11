//
//  MediatorA.m
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "MediatorA.h"
#import "VCA.h"

@implementation MediatorA

- (BaseVC *)setTargetVCParameters:(id)parameters
{
    /// 在这个方法内做 VC 的具体初始化
    VCA *vc = [[VCA alloc] initWithName:parameters[@"name"]];
    return vc;
}

@end
