//
//  GuideController.h
//  GuidTest
//
//  Created by cm on 15/12/14.
//  Copyright © 2015年 cm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GuideController;
@protocol GuideDelegate <NSObject>
@optional
- (void)guideControllerDismiss:(GuideController*)guideController;
@end

@interface GuideController : UIViewController

//imageArray 为uiimage数组
- (instancetype)initWithImages:(NSArray*)imageArray;
@property (weak, nonatomic) id<GuideDelegate>delegate;
@end
