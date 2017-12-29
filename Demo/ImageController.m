//
//  ImageController.m
//  DKSHintView
//
//  Created by aDu on 2017/12/29.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "ImageController.h"
#import "MBProgressHUD.h"
#import "UIScrollView+HintView.h"

@interface ImageController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation ImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self loadData];
    [self hideExtraCellLine:self.tableView];
    self.tableView.hintView = [DKSHintView showHintViewWithImageStr:@"noData" titleStr:@"暂时没有获取到相关数据"];
}

#pragma mark ====== 加载数据 ======
- (void)loadData {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [self.dataAry removeAllObjects];
        NSArray *arr = @[@"数据1", @"数据2", @"数据3"];
        [self.dataAry addObjectsFromArray:arr];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

#pragma mark ====== UITableViewDelegate ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%@行", @(indexPath.row)];
    return cell;
}

#pragma mark ====== 添加数据 ======
- (IBAction)addData:(id)sender {
    
}

#pragma mark ====== 删除数据 ======
- (IBAction)deleteData:(id)sender {
    [self.dataAry removeAllObjects];
    [self.tableView reloadData];
}

#pragma mark ====== init ======
- (NSMutableArray *)dataAry {
    if (!_dataAry) {
        _dataAry = [NSMutableArray array];
    }
    return _dataAry;
}

- (void)hideExtraCellLine:(UITableView *)tableview {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

@end
