//
//  TotalController.m
//  DKSHintView
//
//  Created by aDu on 2018/1/2.
//  Copyright © 2018年 DuKaiShun. All rights reserved.
//

#import "TotalController.h"
#import "UIScrollView+HintView.h"
#import "MBProgressHUD.h"

@interface TotalController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataAry;

@end

@implementation TotalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self loadData];
    [self hideExtraCellLine:self.tableView];
        self.tableView.hintView = [DKSHintView showHintViewWithImageStr:@"noData" titleStr:@"暂未获取到相关数据" btnTitleStr:@"重新加载" target:self action:@selector(loadData)];
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataAry[indexPath.row]];
    return cell;
}

#pragma mark ====== 添加数据 ======
- (IBAction)addData:(id)sender {
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

- (IBAction)deleteData:(id)sender {
    if (self.dataAry.count > 0) {
        [self.dataAry removeLastObject];
    }
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
