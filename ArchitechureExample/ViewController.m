//
//  ViewController.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import "ViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"MVC",@"MVP",@"MVVM", nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"indexPath.row:%ld",indexPath.row);
    switch (indexPath.row) {
        case 0: // MVC
        {
            
        }
            break;
        case 1: // MVP
        {
            MVPViewController *mvpVC = [[MVPViewController alloc] init];
            [self.navigationController pushViewController:mvpVC animated:YES];
        }
            break;
        case 2: // MVVM
        {
            MVVMViewController *mvvmVC = [[MVVMViewController alloc] init];
            [self.navigationController pushViewController:mvvmVC animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
