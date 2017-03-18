//
//  ViewController.m
//  DWQRuntimeDynamicAddMethod
//
//  Created by 杜文全 on 17/3/18.
//  Copyright © 2017年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "ViewController.h"
#import "Cat.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Cat *cat=[[Cat alloc]init];
    
    [cat performSelector:@selector(eat:) withObject:@22];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
