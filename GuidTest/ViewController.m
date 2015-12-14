//
//  ViewController.m
//  GuidTest
//
//  Created by cm on 15/12/14.
//  Copyright © 2015年 cm. All rights reserved.
//

#import "ViewController.h"
#import "GuideController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100, 20)];
    label.text = @"点我啊";
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImage *first = [UIImage imageNamed:@"pic0.jpg"];
    UIImage *sec = [UIImage imageNamed:@"pic1.jpg"];
    UIImage *third = [UIImage imageNamed:@"pic2.jpg"];
    UIImage *fourth = [UIImage imageNamed:@"pic3.jpg"];
    NSArray *imageArray = [NSArray arrayWithObjects:first,sec,third,fourth, nil];
    GuideController *guideController = [[GuideController alloc] initWithImages:imageArray];
    [self presentViewController:guideController animated:YES completion:nil];
}

@end
