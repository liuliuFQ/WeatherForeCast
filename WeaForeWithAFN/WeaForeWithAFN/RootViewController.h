//
//  RootViewController.h
//  WeaForeWithAFN
//
//  Created by Ibokan on 14-2-14.
//  Copyright (c) 2014年 CainiaoLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kIPURL @"http://61.4.185.48:81/g/"
#define kWeathPath @"http://m.weather.com.cn/data/cityNumber.html"
@interface RootViewController : UIViewController
{
    NSString * _cityID;


}

@property(nonatomic,strong)UILabel * cityLabel;
@property(nonatomic,strong)UILabel * dayLabel;
@property(nonatomic,strong)UILabel * weekLabel;
@property(nonatomic,strong)UILabel * tempLabel;
@property(nonatomic,strong)UILabel * weatherLabel;

@end
