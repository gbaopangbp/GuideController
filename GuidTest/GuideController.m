//
//  GuideController.m
//  GuidTest
//
//  Created by cm on 15/12/14.
//  Copyright © 2015年 cm. All rights reserved.
//

#import "GuideController.h"

#define YYTScreenWidth     [UIScreen mainScreen].bounds.size.width
#define YYTScreenHeight    [UIScreen mainScreen].bounds.size.height



@interface GuideController ()<UIScrollViewDelegate>

@property (copy, nonatomic) NSArray *imageArray;   //uiiamge
@property (weak, nonatomic) UIScrollView *scrollView;
@property (weak, nonatomic) UIPageControl *pageControl;
@end

@implementation GuideController
#pragma mark life cycle
//初始化
- (instancetype)initWithImages:(NSArray *)imageArray{
    self = [super init];
    if (self) {
        _imageArray = imageArray;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //生成scrollview
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, YYTScreenWidth, YYTScreenHeight)];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(YYTScreenWidth * [self.imageArray count], YYTScreenHeight);
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    self.scrollView = scrollView;
    
    //将图片加入scrollview
    for (NSInteger i = 0; i < [self.imageArray count]; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(YYTScreenWidth * i, 0, YYTScreenWidth, YYTScreenHeight)];
        imageView.image = self.imageArray[i];
        [scrollView addSubview:imageView];
        
        //给最后一张图片添加进入按钮
        if (i == [self.imageArray count] - 1) {
            UIButton *jumpButton = [[UIButton alloc] initWithFrame:CGRectMake(YYTScreenWidth -  150, YYTScreenHeight - 200, 50, 25)];
            [jumpButton setTitle:@"进入" forState:UIControlStateNormal];
            jumpButton.backgroundColor = [UIColor grayColor];
            [jumpButton addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
            
            [imageView addSubview:jumpButton];
            imageView.userInteractionEnabled = YES;
        }
    }
    
    //增加pagecontrol，如果图片带点就不需要
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, YYTScreenHeight - 100, YYTScreenWidth, 30)];
    pageControl.numberOfPages = [self.imageArray count];
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [pageControl addTarget:self action:@selector(pageSelect:) forControlEvents:UIControlEventValueChanged];
    pageControl.hidesForSinglePage = YES;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}

#pragma mark - UIScrollViewDelegate
//滚动时更新pagecontrol
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageControl.currentPage = scrollView.contentOffset.x/YYTScreenWidth;
}

#pragma mark - event response
//pagecontrol修改时，更新scrollview
- (void)pageSelect:(UIPageControl*)pageControl{
    self.scrollView.contentOffset = CGPointMake(YYTScreenWidth * pageControl.currentPage, 0);

}

//进入时，发送代理消息
- (void)enter{
    if ([self.delegate respondsToSelector:@selector(guideControllerDismiss:)]) {
        [self.delegate guideControllerDismiss:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
