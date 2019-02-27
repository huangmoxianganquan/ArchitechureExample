//
//  MVVMTableViewCell.h
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/27.
//  Copyright © 2019 清风. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,MVVMTableViewCellEventType){
    MVVMTableViewCellEventTypeInsertHead,
    MVVMTableViewCellEventTypeRemove,
    MVVMTableViewCellEventTypeInsertEnd
};

static NSString *kNotificationEvent = @"kNotification";

NS_ASSUME_NONNULL_BEGIN

@interface MVVMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@end

NS_ASSUME_NONNULL_END
