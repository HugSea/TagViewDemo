//
//  TagCollectionViewCell.h
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TagModel.h"

@interface TagCollectionViewCell : UICollectionViewCell

// 模型
@property (nonatomic, strong) TagModel *tagModel;
@property (nonatomic, strong) UIButton *contentBtn;
@property (nonatomic, strong) UIButton *deleteBtn;
// 点击按钮事件
@property (nonatomic, copy) void(^contentBtnClick)(void);
// 点击x号事件
@property (nonatomic, copy) void(^deleteBtnClick)(void);

@end
