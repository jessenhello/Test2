//
//  SmallTableViewCell.m
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import "SmallTableViewCell.h"
#import "SmallView.h"
#import "Masonry.h"

@implementation SmallTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        SmallView *smallView = [[SmallView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 180)];
        [self.contentView addSubview:smallView];
        smallView.backgroundColor = [UIColor blueColor];
        [smallView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.width.mas_equalTo(280);
            make.height.mas_equalTo(180);
        }];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
