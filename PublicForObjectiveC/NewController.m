//
//  NewController.m
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "NewController.h"

@interface NewController ()

@end

@implementation NewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = COLOR_GREEN;
    
    [[HTTPManager shareHTTPManager]createUserLoginRequestFrom:@"wwwwww" passsword:@"qqqqq" successFinsh:^(NSDictionary *dic) {
        
        NSLog(@"cecece%@",dic);
        
    } requestFail:^(NSError *error) {
        NSLog(@"fail:%@",error.description);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
