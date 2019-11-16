//
//  FirstViewController.m
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import "FirstViewController.h"
#import "SmallView.h"
#import "PullView.h"
#import "MapView.h"
#import "Masonry.h"

@interface FirstViewController ()
@property (nonatomic, strong)MapView *mapView;
@property (nonatomic, strong)UIScrollView *bottomView;
@property (nonatomic, strong)PullView *pullView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"美食餐饮";
    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    
    UIView *containtView = [[UIView alloc]initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 70)];
    containtView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:containtView];
    
    
    UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    searchField.backgroundColor = [UIColor whiteColor];
    searchField.layer.cornerRadius = 5;
    searchField.placeholder = @"输入用户名、地名，找优惠";
    [containtView addSubview:searchField];
    [searchField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(containtView);
        make.height.mas_equalTo(50);
        make.width.equalTo(containtView);
    }];
    
    _mapView = [[MapView alloc]initWithFrame:CGRectMake(0, 88 + 70, self.view.frame.size.width, self.view.frame.size.height - 88 * 2)];
    
    _mapView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_mapView];
    
    _bottomView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 240, self.view.frame.size.width, 180)];
    _bottomView.contentSize = CGSizeMake(5 * self.view.frame.size.width, 0);
    _bottomView.showsVerticalScrollIndicator = NO;
    _bottomView.showsHorizontalScrollIndicator = NO;
//    _bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_bottomView];
    
    for (int i = 0; i < 5; i++) {
        SmallView *smallView = [[SmallView alloc]initWithFrame:CGRectMake(300 * i, 0, 280, 180)];
        [_bottomView addSubview:smallView];
    }
    
    _pullView = [[PullView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    _pullView.layer.cornerRadius = 10;
    _pullView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pullView];
    
    _mapView.delegate = _pullView;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
