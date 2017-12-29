//
//  UIView+DKSFrameTool.m
//  Demo
//
//  Created by aDu on 2017/12/28.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "UIView+DKSFrameTool.h"

@implementation UIView (DKSFrameTool)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)x {
    self.center = CGPointMake(x, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)y {
    self.center = CGPointMake(self.center.x, y);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    //    self.origin = CGPointMake(origin.x, origin.y);
    self.frame = (CGRect){
        .origin = {.x = origin.x, .y = origin.y},
        .size = {.width = self.width, .height = self.height}
    };
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    //    self.size = CGSizeMake(size.width, size.height);
    self.frame = (CGRect){
        .origin = {.x = self.x, .y = self.y},
        .size = {.width = size.width, .height = size.height}
    };
}

/** 获取最大x */
- (CGFloat)maxX {
    return self.x + self.width;
}
/** 获取最小x */
- (CGFloat)minX {
    return self.x;
}

/** 获取最大y */
- (CGFloat)maxY {
    return self.y + self.height;
}
/** 获取最小y */
- (CGFloat)minY {
    return self.y;
}

@end

