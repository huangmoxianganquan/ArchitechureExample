//
//  MVPTableViewCell.h
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVPTableViewCellDelegate <NSObject>

- (void)removeItem:(NSString *)itemStr;

- (void)insertItemToHead:(NSString *)itemStr;

- (void)insertItemToEnd:(NSString *)itemStr;

@end

NS_ASSUME_NONNULL_BEGIN

@interface MVPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) id <MVPTableViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
