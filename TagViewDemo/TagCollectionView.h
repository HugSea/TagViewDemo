//
//  TagCollectionView.h
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagCollectionView : UICollectionView

@property (nonatomic, strong) NSMutableArray *tagModels;
@property (nonatomic, copy) void(^cellClickBlock)(void);

+ (instancetype)tagCollectionViewWithTagModels:(NSArray *)tagModels cellClickBlock:(void(^)(void))cellClickBlock;

@end
