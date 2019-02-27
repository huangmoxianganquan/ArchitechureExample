//
//  Presenter.h
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVPTableViewCell.h"

@protocol PresenterDelegate <NSObject>

- (void)reloadData;

@end

NS_ASSUME_NONNULL_BEGIN

@interface Presenter : NSObject<MVPTableViewCellDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id <PresenterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
