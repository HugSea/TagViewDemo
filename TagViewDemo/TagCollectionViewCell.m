//
//  TagCollectionViewCell.m
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import "TagCollectionViewCell.h"

@implementation TagCollectionViewCell

- (void)setTagModel:(TagModel *)tagModel {
    _tagModel = tagModel;
    
    // 创建内容按钮
    UIButton *contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:contentBtn];
    CGRect frame = self.bounds;
    frame.size.width -= 7.5;
    frame.size.height -= 7.5;
    frame.origin.y += 7.5;
    contentBtn.frame = frame;
    [contentBtn setTitle:tagModel.content forState:UIControlStateNormal];
    [contentBtn setBackgroundColor:tagModel.color];
    contentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [contentBtn addTarget:self action:@selector(contentBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    contentBtn.layer.cornerRadius = 7;
    contentBtn.clipsToBounds = YES;
    self.contentBtn = contentBtn;
    
    // 创建x按钮
    UIButton *delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:delBtn];
    CGFloat btnW = 15;
    CGFloat btnH = 15;
    CGFloat btnX = CGRectGetMaxX(contentBtn.frame) - btnW * 0.5;
    CGFloat btnY = contentBtn.frame.origin.y - btnH * 0.5;
    delBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    [delBtn setImage:[UIImage imageNamed:@"deleteBtn"] forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(delBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    self.deleteBtn = delBtn;
    delBtn.hidden = tagModel.isHide;
    
}

/**
 *  点击内容按钮事件
 */
- (void)contentBtnClickAction {
    if (self.contentBtnClick) {
        self.contentBtnClick();
    }
}

/**
 *  点击删除按钮事件
 */
- (void)delBtnClickAction {
    if (self.deleteBtnClick) {
        self.deleteBtnClick();
    }
}

@end
