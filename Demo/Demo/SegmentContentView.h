//
//  SegmentContentView.h
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegmentContentView : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleHeight:(CGFloat)titleHeight viewControllerNames:(NSArray *)viewControllerNames;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleHeight:(CGFloat)titleHeight viewControllerNames:(NSArray *)viewControllerNames selectedIndex:(NSInteger)index;

@end
