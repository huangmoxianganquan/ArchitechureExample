//
//  Presenter.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import "Presenter.h"

@interface Presenter ()

@end

@implementation Presenter

- (id)init{
    if (self = [super init]) {
        NSArray *array = @[@"浙江",@"西藏",@"香港",@"台湾",@"江西",@"北京",@"黑龙江",@"湖南"];
        self.dataArray = [NSMutableArray arrayWithArray:array];
    }
    return self;
}

- (void)insertItemToHead:(NSString *)itemStr{
    [self.dataArray removeObject:itemStr];
    [self.dataArray insertObject:itemStr atIndex:0];
    if ([self.delegate respondsToSelector:@selector(reloadData)]) {
        [self.delegate reloadData];
    }
}

- (void)insertItemToEnd:(NSString *)itemStr{
    
    [self.dataArray removeObject:itemStr];
    [self.dataArray insertObject:itemStr atIndex:self.dataArray.count];
    if ([self.delegate respondsToSelector:@selector(reloadData)]) {
        [self.delegate reloadData];
    }
}

- (void)removeItem:(NSString *)itemStr{
    [self.dataArray removeObject:itemStr];
    if ([self.delegate respondsToSelector:@selector(reloadData)]) {
        [self.delegate reloadData];
    }
}

@end
