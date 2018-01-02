//
//  CustomController.m
//  DKSHintView
//
//  Created by aDu on 2018/1/2.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import "CustomController.h"
#import "DKSHintView.h"

@interface CustomController ()

@property (weak, nonatomic) IBOutlet UIView *customView;

@end

@implementation CustomController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)loadData {
    NSLog(@"重新加载");
}

- (IBAction)showHintView:(id)sender {
    [DKSHintView showHintViewWithCustomView:self.customView imageStr:@"noData" titleStr:@"暂无数据" btnTitleStr:@"重新加载" target:self action:@selector(loadData)];
}

- (IBAction)hideHintView:(id)sender {
    for (UIView *view in self.customView.subviews) {
        [view removeFromSuperview];
    }
}

@end
