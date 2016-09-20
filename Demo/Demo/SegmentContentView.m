//
//  SegmentContentView.m
//  Demo
//
//  Created by 李长浩 on 16/5/23.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "SegmentContentView.h"
#import "ScrollSegment.h"
#import "UIView+Sizes.h"
#import "SegmentContentCell.h"

@interface SegmentContentView () <UICollectionViewDataSource,UICollectionViewDelegate,ScrollSegmentDelegate>

@property (nonatomic, strong) ScrollSegment *segment;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSMutableArray *controllers;

@end

@implementation SegmentContentView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleHeight:(CGFloat)titleHeight viewControllerNames:(NSArray *)viewControllerNames selectedIndex:(NSInteger)index {
    if (self = [super initWithFrame:frame]) {
        [self setupScrollSegment:titles titleHeight:titleHeight selectedIndex:index];
        [self setupContentViews:titleHeight selectedIndex:index];
        for (NSString *name in viewControllerNames) {
            Class someClass = NSClassFromString(name);
            UIViewController *vc = [[someClass alloc] init];
            [self.controllers addObject:vc];
        }
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles titleHeight:(CGFloat)titleHeight viewControllerNames:(NSArray *)viewControllerNames {
    return [self initWithFrame:frame titles:titles titleHeight:titleHeight viewControllerNames:viewControllerNames selectedIndex:0];
}

- (void)setupScrollSegment:(NSArray *)titles titleHeight:(CGFloat)titleHeight selectedIndex:(NSInteger)index {
    self.segment = [[ScrollSegment alloc] initWithFrame:CGRectMake(0, 0, self.width, titleHeight) titles:titles selectedIndex:index];
    self.segment.delegate = self;
    [self addSubview:self.segment];
}

- (void)setupContentViews:(CGFloat)titleHeight selectedIndex:(NSInteger)index {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, titleHeight, self.width, self.height - titleHeight) collectionViewLayout:self.flowLayout];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[SegmentContentCell class] forCellWithReuseIdentifier:@"SegmentContentCell"];
    self.collectionView.contentOffset = CGPointMake(self.width * index, 0);
    [self addSubview:self.collectionView];
}

#pragma mark - lazy
- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

#pragma mark - collectionView delegate dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.controllers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SegmentContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SegmentContentCell" forIndexPath:indexPath];
    cell.controller = self.controllers[indexPath.item];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return collectionView.bounds.size;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = self.collectionView.contentOffset;
    CGFloat pageFloat = offset.x / self.collectionView.bounds.size.width;
    if (pageFloat < 0) {
        pageFloat = 0;
    }
    if (pageFloat > self.controllers.count) {
        pageFloat = self.controllers.count;
    }
    NSInteger page = (NSInteger)pageFloat;
    self.segment.index = page + 1000;
}

#pragma mark - ScrollSegmentDelegate
- (void)didSelectedItemAtIndex:(NSInteger)index {
    CGFloat width = self.collectionView.width;
    [self.collectionView setContentOffset:CGPointMake(width * index, 0) animated:NO];
}

@end
