//
//  SegmentContentCell.m
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "SegmentContentCell.h"

@implementation SegmentContentCell

- (void)setController:(UIViewController *)controller {
    if (_controller != controller) {
        _controller = nil;
        _controller = controller;
        [self.contentView addSubview:_controller.view];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    self.controller.view.frame = self.contentView.bounds;
}

@end
