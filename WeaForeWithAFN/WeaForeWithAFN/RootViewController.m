//
//  RootViewController.m
//  WeaForeWithAFN
//
//  Created by Ibokan on 14-2-14.
//  Copyright (c) 2014年 CainiaoLiu. All rights reserved.
//

#import "RootViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <UIKit+AFNetworking.h>
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
    [self doIPResquest];
    
}



#pragma mark--search IP and cityID
-(void)doIPResquest{
    NSURL * url = [NSURL URLWithString:kIPURL];
    NSError * error;
    NSString * ipConStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSString * str ;
   
    for (int i = 0 ; i < [ipConStr length] - 2; i++) {
       
            str = [ipConStr substringWithRange:NSMakeRange(i , 2)];
            if ([str isEqualToString:@"id"] && ![[ipConStr substringWithRange:NSMakeRange(i + 3, 1)]isEqualToString:@"c"]) {
                _cityID =[ipConStr substringWithRange:NSMakeRange(i+3, 9)];
                [self doWeatherRequest];
                return;
            
        }
    }

    
   
}

/**
 *  Using cocospod to input AFNetworking and get weatherforecast
*/
-(void)doWeatherRequest{
    NSString * weaPath = [kWeathPath stringByReplacingOccurrencesOfString:@"cityNumber" withString:_cityID];
    //To get weather by AFHTTPRequestOperationManager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:weaPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary * dic = [NSDictionary dictionaryWithDictionary:responseObject];
        NSDictionary * weatherInfo = [dic objectForKey:@"weatherinfo"];
        self.cityLabel.text = [weatherInfo objectForKey:@"city"];
        self.dayLabel.text = [weatherInfo objectForKey:@"date_y"];
        self.weekLabel.text = [weatherInfo objectForKey:@"week"];
        self.tempLabel.text = [weatherInfo objectForKey:@"temp1"];
        self.weatherLabel.text = [weatherInfo objectForKey:@"weather1"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];



}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
