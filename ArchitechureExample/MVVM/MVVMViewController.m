//
//  MVVMViewController.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/27.
//  Copyright © 2019 清风. All rights reserved.
//

#import "MVVMViewController.h"
#import "ViewModel.h"
#import "MVVMHeadView.h"
#import "MVVMTableViewCell.h"

@interface MVVMViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MVVMHeadView *headView;
@property (nonatomic, strong) ViewModel *viewModel;
@end

@implementation MVVMViewController

- (void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVM";
    
    self.viewModel = [ViewModel new];
    __weak typeof(self) weakSelf = self;
    self.viewModel.successBlock = ^{
        [weakSelf.headView setData:weakSelf.viewModel.dataArray];
    };
    
    MVVMHeadView *headView = [[MVVMHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    self.headView = headView;
    [self.headView setData:self.viewModel.dataArray];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = headView;
    //[self.tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MVPTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:@"MVVMTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([MVVMTableViewCell class])];
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MVVMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MVVMTableViewCell class])];
    cell.titleLable.text = [self.viewModel.dataArray objectAtIndex:indexPath.row];
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
