//
//  ViewController.m
//  runloop
//
//  Created by ants on 17/2/10.
//  Copyright © 2017年 ants. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSPortDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    static NSThread *onceThread = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        onceThread = [[NSThread alloc] initWithTarget:self selector:@selector(threadMethod) object:nil];
        [onceThread start];
    });
    
    [self testDemo3];
}

- (void)threadMethod
{
    
    @autoreleasepool {
        NSLog(@"---%d---",__LINE__);
        [[NSThread currentThread] setName:@"HELLO"];
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runloop run];
    }
}

- (void)testDemo3
{
    NSMachPort *mainPort = [[NSMachPort alloc] init];
    NSPort *threadPort = [NSMachPort port];
    threadPort.delegate = self;
    
    // 给主线程Runloop加一个端口
    [[NSRunLoop currentRunLoop] addPort:mainPort forMode:NSDefaultRunLoopMode];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 添加一个port
        [[NSThread currentThread] setName:@"I am Thread!!!"];
        [[NSRunLoop currentRunLoop] addPort:threadPort forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
    
    NSString *s1 = @"hello";
    NSData *data = [s1 dataUsingEncoding:NSUTF8StringEncoding];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *array = [NSMutableArray arrayWithArray:@[mainPort,data]];
        // 过2s向threadPort发送一条消息
        [threadPort sendBeforeDate:[NSDate date] msgid:1000 components:array from:mainPort reserved:0];
    });
}
- (void)handlePortMessage:(id)message
{
    NSLog(@"receive msg,thread is %@",[NSThread currentThread]);
    
    // use kvc get massage
    NSArray *array = [message valueForKeyPath:@"components"];
    NSLog(@"message-%@",array);
    NSData *data = array[1];
    NSString *s1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"---%@---",s1);
}

@end
