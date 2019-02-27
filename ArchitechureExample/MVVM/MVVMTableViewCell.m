//
//  MVVMTableViewCell.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/27.
//  Copyright © 2019 清风. All rights reserved.
//

#import "MVVMTableViewCell.h"

@implementation MVVMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)insertHeadBtnClick:(id)sender {
    //[[NSNotificationCenter defaultCenter] postNotificationName:kNotificationEvent object:self.titleLabel.text];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationEvent object:@[@(MVVMTableViewCellEventTypeInsertHead),self.titleLable.text]];
}

- (IBAction)removeBtnClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationEvent object:@[@(MVVMTableViewCellEventTypeRemove),self.titleLable.text]];
}

- (IBAction)insertEndBtnClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationEvent object:@[@(MVVMTableViewCellEventTypeInsertEnd),self.titleLable.text]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
