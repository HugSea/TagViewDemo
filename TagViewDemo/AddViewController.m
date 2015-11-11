//
//  AddViewController.m
//  TagViewDemo
//
//  Created by 张庆杰 on 15/10/27.
//  Copyright © 2015年 QJ. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)addBtnClick;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addBtnClick {
    if (self.addTextBlock) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        self.addTextBlock(self.textField.text);
    }
}
@end
