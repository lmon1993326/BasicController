//
//  ViewController.m
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "ViewController.h"
#import "NewController.h"
#import "CeshiDay522/CeshiDay522.h"

@interface ViewController ()

@property (nonatomic, strong) BloomiFs *bloomifs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.bloomifs = [[BloomiFs alloc]initWithString:@"测试机"];
}
- (IBAction)clickme:(id)sender {
    NewController *nc = [[NewController alloc]init];
    
    [self.navigationController pushViewController:nc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
