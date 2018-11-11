//
//  VCA.m
//  HJMediator
//
//  Created by eassy on 2018/11/9.
//  Copyright © 2018年 eassy. All rights reserved.
//

#import "VCA.h"

@interface VCA ()

@end

@implementation VCA

- (instancetype)initWithName:(NSString *)name
{
    if (self == [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 有时候会有一些延时方法需要外界调用
 
 @param timeInterval 延时时间
 */
- (void)getDataAfterDelay:(NSNumber *)timeInterval sleepTime:(NSNumber *)sleepTime wakeBlock:(id)wakeBlock
{
    
}

@end
