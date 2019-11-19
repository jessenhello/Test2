//
//  MainViewController.m
//  Test
//
//  Created by Jessen hsu on 2019/11/16.
//  Copyright © 2019 Jessen hsu. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 88, 100, 50)];
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    [btn setTitle:@"美食餐饮" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
- (void)dealloc{
    NSLog(@"555");
}
- (void)btnClick:(UIButton *)sender{
    FirstViewController *firstVC = [[FirstViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:firstVC];
    //其实实际开发中应该这么写
   
 UIWindow *windows = [UIApplication sharedApplication].windows.firstObject;
 
//    NSSet *set =[UIApplication sharedApplication].connectedScenes;
//    UIWindowScene *sczene = [set anyObject];
//    UIWindow *windows = scene.windows[0];
    windows.rootViewController = nav;

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
