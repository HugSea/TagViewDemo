//
//  TagCollectionView.m
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import "TagCollectionView.h"
#import "TagCollectionViewCell.h"
#import "TagModel.h"
#import "MyFlowLayout.h"
#import "AddViewController.h"

@interface TagCollectionView() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation TagCollectionView

- (NSMutableArray *)tagModels {
    if (!_tagModels) {
        _tagModels = [[NSMutableArray alloc] init];
    }
    return _tagModels;
}

+ (instancetype)tagCollectionViewWithTagModels:(NSArray *)tagModels cellClickBlock:(void (^)(void))cellClickBlock{
    TagCollectionView *tagCollectionView = [[TagCollectionView alloc] init];
    tagCollectionView.tagModels = tagModels;
    tagCollectionView.cellClickBlock = cellClickBlock;
    return tagCollectionView;
}

- (instancetype)init {
    MyFlowLayout *layout = [[MyFlowLayout alloc] init];
    // 最小列间距
    layout.minimumInteritemSpacing = 10;
    // 最小行间距
//    layout.minimumLineSpacing = 20;
    CGSize size = CGSizeZero;
    size.width = ([UIScreen mainScreen].bounds.size.width - 20 * 2 - 10 * 3) * 0.25 + 7.5;
    size.height = 25 + 7.5;
    layout.itemSize = size;
    
    return [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
}

- (void)didMoveToSuperview {
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    // 设置代理和数据源
    self.delegate = self;
    self.dataSource  =self;
    // 注册cell
    [self registerClass:[TagCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([TagCollectionViewCell class])];
    self.backgroundColor = [UIColor whiteColor];
}

#pragma mark - collectionView代理方法和数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tagModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TagCollectionViewCell class]) forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    TagModel *tagModel = self.tagModels[indexPath.item];
    cell.tagModel = tagModel;
    
    // 设置cell的按钮点击block
    __weak typeof(cell)weakCell = cell;
    __weak typeof(self)weakSelf = self;
    cell.contentBtnClick = ^{
        if ([weakCell.tagModel.flag isEqual:@"添加"]) {
            for (int i = 0; i < weakSelf.tagModels.count - 2; i++) {
                TagModel *tagModel = weakSelf.tagModels[i];
                tagModel.isHide = YES;
            }
            TagModel *tagModel = [weakSelf.tagModels lastObject];
            tagModel.content = @"编辑";
            tagModel.flag = @"编辑";
            [weakSelf reloadData];
            if (weakSelf.cellClickBlock) {
                weakSelf.cellClickBlock();
            }
            
        } else if ([weakCell.tagModel.flag isEqual:@"编辑"]) {
            weakCell.tagModel.content = @"取消";
            weakCell.tagModel.flag = @"取消";
            for (int i = 0; i < weakSelf.tagModels.count - 2; i++) {
                TagModel *tagModel = weakSelf.tagModels[i];
                tagModel.isHide = NO;
            }
            [weakSelf reloadData];
        } else if ([weakCell.tagModel.flag isEqual:@"取消"]) {
            weakCell.tagModel.content = @"编辑";
            weakCell.tagModel.flag = @"编辑";
            for (int i = 0; i < weakSelf.tagModels.count - 2; i++) {
                TagModel *tagModel = weakSelf.tagModels[i];
                tagModel.isHide = YES;
            }
            [weakSelf reloadData];
        } else {
            NSLog(@"选中按钮");
        }
    };
    
    // 设置cell的删除按钮点击block
    cell.deleteBtnClick = ^{
        NSLog(@"delete");
        [weakSelf.tagModels removeObject:weakCell.tagModel];
        [weakSelf reloadData];
    };
    
    return cell;
}

@end
