//
//  ViewModel.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/27.
//  Copyright © 2019 清风. All rights reserved.
//

#import "ViewModel.h"
#import "MVVMTableViewCell.h"

@implementation ViewModel

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)init{
    if (self = [super init]) {
        NSArray *array = @[@"浙江",@"西藏",@"香港",@"台湾",@"江西",@"北京",@"黑龙江",@"湖南"];
        self.dataArray = [NSMutableArray arrayWithArray:array];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellEventClick:) name:kNotificationEvent object:nil];
    }
    return self;
}

- (void)cellEventClick:(NSNotification *)notification{
    NSArray *array = (NSArray *)notification.object;
    MVVMTableViewCellEventType type = (MVVMTableViewCellEventType)(((NSNumber *)array[0]).integerValue);
    NSString *itemStr = array[1];
    switch (type) {
        case MVVMTableViewCellEventTypeInsertHead:
        {
            [self.dataArray removeObject:itemStr];
            [self.dataArray insertObject:itemStr atIndex:0];
        }
            break;
        case MVVMTableViewCellEventTypeRemove:
        {
            [self.dataArray removeObject:itemStr];
        }
            break;
        case MVVMTableViewCellEventTypeInsertEnd:
        {
            [self.dataArray removeObject:itemStr];
            [self.dataArray insertObject:itemStr atIndex:self.dataArray.count];
        }
            break;
        default:
            break;
    }
    
    if (self.successBlock) {
        self.successBlock();
    }
}

@end
