//
//  StudyPlanView.m
//  Demo
//
//  Created by 李长浩 on 16/5/24.
//  Copyright © 2016年 北京精智科技. All rights reserved.
//

#import "StudyPlanView.h"

@interface StudyPlanView ()

@property (weak, nonatomic) IBOutlet UILabel *studyLabel;

@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *finishLabel;

@end

@implementation StudyPlanView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)didSelectedWordButton:(UIButton *)sender {
    self.taskButton.selected = NO;
    sender.selected = YES;
    
    self.studyLabel.text = @"50个";
    self.reviewLabel.text = @"30个";
    self.timeLabel.text = @"120分钟";
    self.finishLabel.text = @"2016年6月9日 共17天";
}

- (IBAction)didSelectedTaskButton:(UIButton *)sender {
    self.wordButton.selected = NO;
    sender.selected = YES;
    
    self.studyLabel.text = @"2关";
    self.reviewLabel.text = @"1关";
    self.timeLabel.text = @"150分钟";
    self.finishLabel.text = @"2016年6月15日 共25天";
}

@end
