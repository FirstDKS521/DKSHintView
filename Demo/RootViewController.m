//
//  RootViewController.m
//  DKSHintView
//
//  Created by aDu on 2017/12/29.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "RootViewController.h"
#import "ImageController.h"

//状态栏和导航栏的总高度
#define StatusNav_Height (isIphoneX ? 88 : 64)
//判断是否是iPhoneX
#define isIphoneX (Screen_Width == 375.f && Screen_Height == 812.f ? YES : NO)
//获取屏幕的宽度和高度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height
@interface RootViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataAry;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.dataAry = @[@"只显示图片",
                     @"只显示文案",
                     @"只显示按钮",
                     @"显示图片、文案",
                     @"显示文案、按钮",
                     @"显示所有控件"];

    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataAry[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    switch (row) {
        case 0: {
            ImageController *imgVC = [[ImageController alloc] init];
            [self.navigationController pushViewController:imgVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark ====== init ======
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - StatusNav_Height) style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 70;
        [self hideExtraCellLine:_tableView];
    }
    return _tableView;
}

//隐藏分隔条
- (void)hideExtraCellLine:(UITableView *)tableview {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

@end
