//
//  UIView+Sizes.m
//  LCHSegment
//
//  Created by 李长浩 on 16/5/21.
//  Copyright © 2016年 北京超信. All rights reserved.
//

#import "UIView+Sizes.h"

@implementation UIView (Sizes)

- (CGFloat)x {
    return self.frame.origin.x;
}
- (CGFloat)y {
    return self.frame.origin.x;
}
- (CGFloat)width {
    return self.bounds.size.width;
}
- (CGFloat)height {
    return self.bounds.size.height;
}
- (CGFloat)left {
    return self.x;
}
- (CGFloat)right {
    return self.x + self.width;
}
- (CGFloat)top {
    return self.y;
}
- (CGFloat)bottom {
    return self.y + self.height;
}
- (CGFloat)centerX {
    return self.center.x;
}
- (CGFloat)centerY {
    return self.center.y;
}

@end
