//
//  PullView.m
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import "PullView.h"
#import "MapView.h"
#import "SmallView.h"
#import "SmallTableViewCell.h"

@interface PullView()<MapViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign)CGPoint startPoint;
@property (nonatomic, assign)CGPoint movingPoint;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSMutableArray *dataArr;
@end

@implementation PullView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    
    return self;
}

- (void)createUI{
    
        _dataArr = [NSMutableArray array];
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 88 - 70 - 50) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 200;
        _tableView.separatorStyle = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_tableView];
    
}
- (int)distanceYBetweenPoint:(CGPoint)point1 andPoint:(CGPoint)point2{
    
    return point2.y - point1.y;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _startPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    _movingPoint = [[touches anyObject] locationInView:self];
    int distanceY = [self distanceYBetweenPoint:_startPoint andPoint:_movingPoint];
    CGRect rect = self.frame;
    self.frame = CGRectMake(rect.origin.x, rect.origin.y + distanceY, rect.size.width, rect.size.height - distanceY);
    
    if (self.frame.origin.y < 200) {
        self.frame = CGRectMake(rect.origin.x, 200, rect.size.width, rect.size.height);
    }
    _tableView.frame = CGRectMake(0, 50, self.bounds.size.width, self.bounds.size.height - 50);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

- (void)remakeFrame{
    
    self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    SmallTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[SmallTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
