//
//  AnimationPushFromVC.m
//  转场动画Demo
//
//  Created by congboyang on 2018/8/15.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "AnimationPush_1_VC.h"
#import "AnimationPush_2_VC.h"
#import "PushAnimation.h"

@interface AnimationPush_1_VC ()<UINavigationControllerDelegate>

@end

@implementation AnimationPush_1_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
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

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [[PushAnimation alloc] init];
    }
    
    return nil;
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
