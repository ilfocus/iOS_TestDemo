//
//  ViewController.m
//  notifactionTest
//
//  Created by ants on 17/1/18.
//  Copyright © 2017年 ants. All rights reserved.
//

#import "ViewController.h"
#ifndef YY_CLAMP // return the clamped value
#define YY_CLAMP(_x_, _low_, _high_)  (((_x_) > (_high_)) ? (_high_) : (((_x_) < (_low_)) ? (_low_) : (_x_)))
#endif
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 50, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}


- (void)btnClick
{
    NSLog(@"---点击了Button---");
//    [[NSNotificationCenter defaultCenter] removeObserver:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:nil selector:@selector(moving2Foreground) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    int x = 6;
    NSLog(@"1----%d",YY_CLAMP(x, 5, 10));
    x=3;
    NSLog(@"1----%d",YY_CLAMP(x, 5, 10));
    x=11;
    NSLog(@"1----%d",YY_CLAMP(x, 5, 10));
}

- (void)moving2Foreground
{
    NSLog(@"moving2Foreground");
}

- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
{
    //宣告一個UIDevice指標，並取得目前Device的方向
    UIDevice *device = [UIDevice currentDevice] ;
    
    //取得當前Device的方向，來當作判斷敘述。（Device的方向型態為Integer）
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"螢幕朝上平躺");
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"螢幕朝下平躺");
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"螢幕向左橫置");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"螢幕向右橫置");
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"螢幕直立");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"螢幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"無法辨識");
            break;
    }
    return;
}

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil];
    
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

@end
