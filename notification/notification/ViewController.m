//
//  ViewController.m
//  notification
//
//  Created by ants on 16/11/11.
//  Copyright © 2016年 ants. All rights reserved.
//

#import "ViewController.h"
#import "person.h"

@interface ViewController ()
@property (nonatomic,strong) person *per;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.per = [person new];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self.per selector:@selector(cameraConnect:) name:@"camera" object:nil];
    UIButton *button = [UIButton new];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];

    UIButton *button1 = [UIButton new];
    [self.view addSubview:button1];
    button1.frame = CGRectMake(100, 200, 100, 50);
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(buttonClicked1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton new];
    [self.view addSubview:button2];
    button2.frame = CGRectMake(100, 300, 100, 50);
    button2.backgroundColor = [UIColor yellowColor];
    [button2 addTarget:self action:@selector(buttonClicked2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClicked
{
    NSLog(@"按钮被点击~~~");
    NSDictionary *dic = @{@"camera" : @(YES)};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"camera" object:dic];
}
- (void)buttonClicked1
{
//    if (_per) {
//        _per = nil;
//    }
    [self.per removeNotification];
}
- (void)buttonClicked2
{
    [self.per addNotification];
}
- (void)cameraConnect:(NSNotification *)notification
{
    // 相机连接状态
    id obj = [notification object];//获取到传递的对象
    NSLog(@"相机连接状态--%@",obj);
}
@end
