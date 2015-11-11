//
//  ViewController.m
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/26.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import "ViewController.h"
#import "TagCollectionView.h"
#import "TagModel.h"
#import "AddViewController.h"

@interface ViewController ()

@property (nonatomic, strong) TagCollectionView *tagCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"我是首页";
    self.navigationController.navigationBar.translucent = NO;
    
    NSMutableArray *models = [NSMutableArray array];
    // 创建模型
    // 测试1
    TagModel *editTagModel1 = [[TagModel alloc] init];
    editTagModel1.content = @"谁与争锋";
    editTagModel1.color = [UIColor orangeColor];
    editTagModel1.isHide = YES;
    editTagModel1.flag = @"谁与争锋";
    [models addObject:editTagModel1];
    // 测试2
    TagModel *editTagModel2 = [[TagModel alloc] init];
    editTagModel2.content = @"FS";
    editTagModel2.color = [UIColor orangeColor];
    editTagModel2.isHide = YES;
    editTagModel2.flag = @"双节棍";
    [models addObject:editTagModel2];
    // 添加
    TagModel *addTagModel = [[TagModel alloc] init];
    addTagModel.content = @"+添加";
    addTagModel.color = [UIColor grayColor];
    addTagModel.isHide = YES;
    addTagModel.flag = @"添加";
    [models addObject:addTagModel];
    // 编辑/取消
    TagModel *editTagModel = [[TagModel alloc] init];
    editTagModel.content = @"编辑";
    editTagModel.color = [UIColor grayColor];
    editTagModel.isHide = YES;
    editTagModel.flag = @"编辑";
    [models addObject:editTagModel];
    
    // 创建collectionView
    __weak typeof(self)weakSelf = self;
    self.tagCollectionView = [TagCollectionView tagCollectionViewWithTagModels:models cellClickBlock:^{
        AddViewController *avc = [[AddViewController alloc] init];
        avc.addTextBlock = ^(NSString *text){
            TagModel *tagModel = [[TagModel alloc] init];
            tagModel.content = text;
            tagModel.color = [UIColor orangeColor];
            tagModel.isHide = YES;
            tagModel.flag = text;
            [models insertObject:tagModel atIndex:models.count - 2];
            weakSelf.tagCollectionView.tagModels = models;
            [weakSelf.tagCollectionView reloadData];
//            [tagCollectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
        };
        [weakSelf.navigationController pushViewController:avc animated:YES];
    }];
    self.tagCollectionView.frame = self.view.frame;
    [self.view addSubview:self.tagCollectionView];
    [self.tagCollectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
