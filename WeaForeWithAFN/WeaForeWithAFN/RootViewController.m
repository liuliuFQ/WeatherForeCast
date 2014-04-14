//
//  RootViewController.m
//  WeaForeWithAFN
//
//  Created by Ibokan on 14-4-14.
//  Copyright (c) 2014年 CainiaoLiu. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    [self.view addSubview:self.cityLabel];
    
    self.dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 140, 200, 40)];
    [self.view addSubview:self.dayLabel];
    
    self.weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 180, 200, 40)];
    [self.view addSubview:self.dayLabel];
    
    self.tempLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 220, 200, 40)];
    [self.view addSubview:self.tempLabel];
    
    self.weatherLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 260, 200, 40)];
    [self.view addSubview:self.weekLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
