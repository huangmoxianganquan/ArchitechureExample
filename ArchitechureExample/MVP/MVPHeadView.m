//
//  MVPHeadView.m
//  ArchitechureExample
//
//  Created by 清风 on 2019/2/26.
//  Copyright © 2019 清风. All rights reserved.
//

#import "MVPHeadView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface MVPHeadView()
@property (nonatomic,strong) UILabel *lable;
@end

@implementation MVPHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)setData:(id)data{
    
    for(UIView *subView in self.subviews){
        if ([subView isKindOfClass:[UIButton class]]) {
            [subView removeFromSuperview];
        }
    }
    
    NSArray *dataArray = (NSArray *)data;
    for (int i = 0; i<dataArray.count; i++) {
        
        int row = i % 4;
        int loc = i / 4;
        CGFloat btnW = SCREEN_WIDTH/4;
        CGFloat btnH = 50;
        CGFloat btnX = row*btnW;
        CGFloat btnY = loc*btnH;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:randomColor];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btn.tag = 1000+i;
        //[btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
