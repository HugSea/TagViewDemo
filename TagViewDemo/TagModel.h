//
//  TagModel.h
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TagModel : NSObject

// 内容
@property (nonatomic, copy) NSString *content;
// 颜色
@property (nonatomic, strong) UIColor *color;
// 是否隐藏x按钮
@property (nonatomic, assign) BOOL isHide;
// 标识
@property (nonatomic, copy) NSString *flag;


@end
