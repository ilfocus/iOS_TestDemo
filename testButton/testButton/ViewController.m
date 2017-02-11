//
//  ViewController.m
//  testButton
//
//  Created by ants on 16/9/26.
//  Copyright © 2016年 ants. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIButton *tstBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *tstBtn = [UIButton new];
    tstBtn.frame = CGRectMake(0, 100, 200, 100);
    [tstBtn setImage:[UIImage imageNamed:@"ic_exif_gray"] forState:UIControlStateNormal];
    [tstBtn setImage:[UIImage imageNamed:@"ic_exif_green"] forState:UIControlStateHighlighted];
    [self.view addSubview:tstBtn];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
