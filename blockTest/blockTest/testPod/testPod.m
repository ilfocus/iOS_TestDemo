//
//  testPod.m
//  blockTest
//
//  Created by ants on 16/9/30.
//  Copyright © 2016年 ants. All rights reserved.
//

#import "testPod.h"

@implementation testPod

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"初始化testPod！！！");
    }
    return self;
}



- (void)printfTestPod
{
    NSLog(@"测试POD~~~");
}
@end
