//
//  ViewController.m
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京精智科技. All rights reserved.
//

#import "ViewController.h"
#import "ScrollSegment.h"
#import "SegmentContentView.h"
#import "CollegeExamViewController.h"
#import "CET4ViewController.h"
#import "CET6ViewController.h"
#import "PostgraduateExamViewController.h"
#import "GREViewController.h"
#import "TOEFLViewController.h"
#import "StudyPlanView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *titles = @[@"高考",@"四级",@"六级",@"考研",@"雅思",@"托福"];
    NSArray *names = @[@"CollegeExamViewController",@"CET4ViewController",@"CET6ViewController",@"PostgraduateExamViewController",@"GREViewController",@"TOEFLViewController"];
    SegmentContentView *segmentContent = [[SegmentContentView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight) titles:titles titleHeight:45 viewControllerNames:names];
    [self.view addSubview:segmentContent];
    
//    StudyPlanView *studyPlayView = [[[NSBundle mainBundle] loadNibNamed:@"StudyPlanView" owner:nil options:nil] firstObject];
//    studyPlayView.frame = CGRectMake(0, 64 + RealHeight(211.5), kScreenWidth, 210);
//    [self.view addSubview:studyPlayView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
