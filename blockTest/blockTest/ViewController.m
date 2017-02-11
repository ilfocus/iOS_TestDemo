//
//  ViewController.m
//  blockTest
//
//  Created by ants on 16/9/9.
//  Copyright © 2016年 ants. All rights reserved.
//

#import "ViewController.h"

typedef int(^Add) (int a,int b);

@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    Add add = ^int(int a,int b) {
//        return a + b;
//    };
//    NSLog(@"%d",add(5,6));
    
    [self sendData:10 addVal:^int(int a, int b) {
        a = 10;
        b = 20;
        NSLog(@"block");
        return a + b;
    }];
    NSLog(@"---");
    
}

- (void)sendData:(int)a addVal:(Add)add
{
    NSLog(@"a + add---%d",a + add(1,2));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
