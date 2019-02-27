//
//  ViewModel.h
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/27.
//  Copyright © 2019 清风. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) void (^successBlock)();
@end

NS_ASSUME_NONNULL_END
