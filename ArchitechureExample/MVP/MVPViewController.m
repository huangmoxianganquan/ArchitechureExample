//
//  MVPViewController.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPHeadView.h"
#import "Presenter.h"
#import "MVPTableViewCell.h"

@interface MVPViewController ()<UITableViewDelegate,UITableViewDataSource,PresenterDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) MVPHeadView *headView;
@property (nonatomic, strong) Presenter *presenter;
@end

@implementation MVPViewController

- (void)dealloc{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVP";
    
    self.presenter = [Presenter new];
    
    MVPHeadView *headView = [[MVPHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    self.headView = headView;
    [self.headView setData:self.presenter.dataArray];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableHeaderView = headView;
    //[self.tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:NSStringFromClass([MVPTableViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:@"MVPTableViewCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([MVPTableViewCell class])];
    [self.view addSubview:self.tableView];
    
    self.presenter.delegate = self;
}

- (void)reloadData{
    [self.headView setData:self.presenter.dataArray];
    //[self.tableView reloadData];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.presenter.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MVPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MVPTableViewCell class])];
    cell.titleLabel.text = [self.presenter.dataArray objectAtIndex:indexPath.row];
    cell.delegate = self.presenter;
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
