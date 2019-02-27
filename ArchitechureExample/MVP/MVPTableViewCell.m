//
//  MVPTableViewCell.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import "MVPTableViewCell.h"

@interface MVPTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *insertHeadBtn;
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@property (weak, nonatomic) IBOutlet UIButton *insertEndBtn;
@end

@implementation MVPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)insertHeadBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(insertItemToHead:)]) {
        [self.delegate insertItemToHead:self.titleLabel.text];
    }
}

- (IBAction)insertEndBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(insertItemToEnd:)]) {
        [self.delegate insertItemToEnd:self.titleLabel.text];
    }
}

- (IBAction)removeBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(removeItem:)]) {
        [self.delegate removeItem:self.titleLabel.text];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
