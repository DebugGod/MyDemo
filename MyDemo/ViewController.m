//
//  ViewController.m
//  MyDemo
//
//  Created by wenkehu on 2018/4/18.
//  Copyright © 2018年 wenkehu. All rights reserved.
//

#import "ViewController.h"
#import "DCTabBarViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
    DCTabBarViewController *nav = [[DCTabBarViewController alloc] init];
    keywindow.rootViewController = nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
