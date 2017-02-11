//
//  person.m
//  notification
//
//  Created by ants on 16/11/11.
//  Copyright © 2016年 ants. All rights reserved.
//

#import "person.h"

@implementation person
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"---person --init");
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cameraConnect:) name:@"camera" object:nil];
    }
    return self;
}
- (void)cameraConnect:(NSNotification *)notification
{
    // 相机连接状态
    id obj = [notification object];//获取到传递的对象
    NSLog(@"相机连接状态--%@",obj);
}
- (void)addNotification
{
    NSLog(@"---移除---addNotification---");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        NSLog(@"添加通知");
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cameraConnect:) name:@"camera" object:nil];
    });
}
- (void)removeNotification
{
    NSLog(@"---移除---addNotification---");
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)dealloc
{
    NSLog(@"---person---dealloc");
}
@end
