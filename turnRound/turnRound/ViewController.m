//
//  ViewController.m
//  turnRound
//
//  Created by ants on 17/2/7.
//  Copyright © 2017年 ants. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    [self.view addSubview:self.activityIndicator];
    
    self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.activityIndicator startAnimating];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(timerStop) userInfo:nil repeats:YES];
}
- (void)timerStop
{
    //[self.activityIndicator stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
