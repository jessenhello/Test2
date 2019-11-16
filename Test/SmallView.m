//
//  SmallView.m
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import "SmallView.h"

@implementation SmallView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    self.backgroundColor = [UIColor whiteColor];
    UILabel *huiLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 30, 30)];
    huiLabel.backgroundColor = [UIColor blackColor];
    huiLabel.text = @"惠";
    huiLabel.textAlignment = NSTextAlignmentCenter;
    huiLabel.textColor = [UIColor whiteColor];
    [self addSubview:huiLabel];
    self.layer.cornerRadius = 10;
//    self.backgroundColor = [UIColor grayColor];
    
}
@end
