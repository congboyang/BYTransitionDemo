//
//  AnimationPushFromVC.m
//  转场动画Demo
//
//  Created by congboyang on 2018/8/15.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "AnimationPush_1_VC.h"
#import "AnimationPush_2_VC.h"

@interface AnimationPush_1_VC ()

@end

@implementation AnimationPush_1_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    AnimationPush_2_VC * vc = [[AnimationPush_2_VC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
