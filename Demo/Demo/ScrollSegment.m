//
//  ScrollSegment.m
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "ScrollSegment.h"
#import "UIView+Sizes.h"

#define ButtonWidth 72

#define ColorNormal    [UIColor colorWithRed:0.275 green:0.278 blue:0.298 alpha:1.00]
#define ColorSelected  [UIColor colorWithRed:0.357 green:0.561 blue:1.000 alpha:1.00]

@interface ScrollSegment ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *separaterLine;
@property (nonatomic, strong) UIView *selectedLine;
@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation ScrollSegment

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    if (self = [super initWithFrame:frame]) {
        [self setupViewWithFrame:frame titles:titles selectedIndex:0];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles selectedIndex:(NSInteger)index {
    if (self = [super initWithFrame:frame]) {
        [self setupViewWithFrame:frame titles:titles selectedIndex:index];
    }
    return self;
}

- (void)setupViewWithFrame:(CGRect)frame titles:(NSArray *)titles selectedIndex:(NSInteger)index {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    // 设置按钮
    CGFloat itemRight = 0;
    for (int i = 0; i < titles.count; i++) {
        NSString *title = titles[i];
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.tag = i + 1000;
        [item setTitle:title forState:UIControlStateNormal];
        [item setTitleColor:ColorNormal forState:UIControlStateNormal];
        [item setTitleColor:ColorSelected forState:UIControlStateSelected];
        item.titleLabel.font = [UIFont systemFontOfSize:15];
        [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];

        item.frame = CGRectMake(itemRight, 0, ButtonWidth, self.height);
        
        [self.scrollView addSubview:item];
        [self.items addObject:item];
        
        if (i == index) {
            item.selected = YES;
        }
        itemRight = item.right;
    }
    self.scrollView.contentSize = CGSizeMake(itemRight, -CGFLOAT_MAX);
    [self addSubview:self.scrollView];
    
    // 分割线
    self.separaterLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 0.5, self.width, 0.5)];
    self.separaterLine.backgroundColor = [UIColor colorWithRed:0.757 green:0.761 blue:0.769 alpha:1.00];
    [self addSubview:self.separaterLine];
    // 选中线
    self.selectedLine = [[UIView alloc] initWithFrame:CGRectMake(index * ButtonWidth, self.height - 1.5, ButtonWidth, 1.5)];
    self.selectedLine.backgroundColor = [UIColor colorWithRed:0.361 green:0.565 blue:1.000 alpha:1.00];
    [self.scrollView addSubview:self.selectedLine];
}


- (void)itemSelected:(UIButton *)sender {
    for (UIButton *item in self.items) {
        if (item.tag != sender.tag) {
            item.selected = NO;
        }
    }
    sender.selected = YES;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedItemAtIndex:)]) {
        [self.delegate didSelectedItemAtIndex:sender.tag - 1000];
    }
    
    if (sender.centerX < self.scrollView.width / 2) {
        [self.scrollView setContentOffset:CGPointZero animated:YES];
    } else if (self.scrollView.contentSize.width - sender.centerX < self.scrollView.width / 2) {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.width, 0) animated:YES];
    } else {
        [self.scrollView setContentOffset:CGPointMake(sender.centerX - self.scrollView.width / 2, 0) animated:YES];
    }
    [UIView animateWithDuration:0.4 animations:^{
        self.selectedLine.frame = CGRectMake(sender.left, self.height - 1.5, ButtonWidth, 1.5);
    }];
}

#pragma mark - lazy
- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)setIndex:(NSInteger)index {
    if (_index != index) {
        _index = index;
        [self moveSelectedIndex:index];
    }
}

- (void)moveSelectedIndex:(NSInteger)index {
    for (UIButton *item in self.items) {
        if (item.tag == index) {
            item.selected = YES;
            if (item.centerX < self.scrollView.width / 2) {
                [self.scrollView setContentOffset:CGPointZero animated:YES];
            } else if (self.scrollView.contentSize.width - item.centerX < self.scrollView.width / 2) {
                [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.width, 0) animated:YES];
            } else {
                [self.scrollView setContentOffset:CGPointMake(item.centerX - self.scrollView.width / 2, 0) animated:YES];
            }
            [UIView animateWithDuration:0.4 animations:^{
                self.selectedLine.frame = CGRectMake(item.left, self.height - 1.5, ButtonWidth, 1.5);
            }];
        } else {
            item.selected = NO;
        }
    }
}

@end
