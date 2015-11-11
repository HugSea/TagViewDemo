//
//  AddViewController.h
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/27.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController

@property (nonatomic, copy) void(^addTextBlock)(NSString *text);

@end
