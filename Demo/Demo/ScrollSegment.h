//
//  ScrollSegment.h
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollSegmentDelegate <NSObject>

- (void)didSelectedItemAtIndex:(NSInteger)index;

@end

@interface ScrollSegment : UIView

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) id<ScrollSegmentDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles selectedIndex:(NSInteger)index;

@end
