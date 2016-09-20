//
//  BookCell.m
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京精智科技. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.bookImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:self.bookImageView];
    }
    return self;
}


@end
