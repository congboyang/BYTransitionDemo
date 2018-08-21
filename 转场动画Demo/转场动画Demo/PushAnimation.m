//
//  PushAnimation.m
//  转场动画Demo
//
//  Created by congboyang on 2018/8/21.
//  Copyright © 2018年 丛泊阳. All rights reserved.
//

#import "PushAnimation.h"
#import "AnimationPush_1_VC.h"
#import "AnimationPush_2_VC.h"

@implementation PushAnimation

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 2;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // transitionContext 该参数 可以让我们去访问一些实现对象所必须的对象
    /**
     扩展 UIViewControllerContextTransitioning
     */
    
    // 1.  - （UIView *）containerView;
    // 转场动画的容器 -> 添加两个控制器 视图内容 （注意添加的前后顺序）
    
    
    // 2.  - (UIViewController *)viewControllerForKey:(NSString *)key;
    // 通过该方法拿到过渡的两个VC
    
    // 3.  - (CGRect)initialFrameForViewController:(UIViewController *)vc;
    //     - (CGRect)finalFrameForViewController:(UIViewController *)vc;
    // 通过这个方法 能够获得前后两个 ViewController 的frame
    
    /**
     现在进行动画的实现
     */
    
    
    // 起始VC
    AnimationPush_1_VC *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    // 目的VC
    AnimationPush_2_VC *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 转场视图容器
    UIView *containerView = [transitionContext containerView];
    
    UIView* toView = nil;
    UIView* fromView = nil;
    
    if ([transitionContext respondsToSelector:@selector(viewForKey:)]) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = fromVC.view;
        toView = toVC.view;
    }
    
    
    // 我们需要获取CollectionViewCell 上面的视图 进行做动画
    
    /**
     扩展
     iOS  UIView 中坐标的转换
     */
    
    // - (GPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
    // 将像素Point 由Point所在控制器转换到目标控制器视图View中， 返回在目标视图中的像素值。
    
    // - (GPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
    // 由上面一条相反，获取目标View的像素Point返回到当前控制器View中
    
    // - (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
    // 将坐标frame的rect值，由当前所在的目标视图View中， 返回在当前视图中的rect
    
    // - (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
    // 将坐标frame的rect值，由当前所在的目标视图View中， 返回在当前视图中的rect
    
    //    UIView *screenShot = [fromVC.titleView snapshotViewAfterScreenUpdates:NO];
    //    screenShot.backgroundColor = [UIColor clearColor];
    //    screenShot.frame = toVC.titleView.frame;
    
    // 设置第二个控制器的位置和透明度
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    // 把动画前后的两个ViewController加到容器控制器中
    [containerView addSubview:toView];
    [containerView addSubview:fromView];
    //    [containerView addSubview:screenShot];
    
    [containerView layoutIfNeeded];
    
    // 注意添加顺序
    
    // 现在开始做动画
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
                fromView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        // 动画截图移除View
                toView.alpha = 1;
                fromView.alpha = 1;
        
        // 动画结束
        
        // 一定不要忘记告诉系统动画结束
        // 执行
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
