//
//  UIView+DKSFrameTool.h
//  Demo
//
//  Created by aDu on 2017/12/28.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DKSFrameTool)

/**
 * 左上角x坐标
 */
- (CGFloat)x;
- (void)setX:(CGFloat)x;

/**
 * 左上角y坐标
 */
- (CGFloat)y;
- (void)setY:(CGFloat)y;

/**
 * 宽
 */
- (CGFloat)width;
- (void)setWidth:(CGFloat)width;

/**
 * 高
 */
- (CGFloat)height;
- (void)setHeight:(CGFloat)height;

/**
 * 中心点x
 */
- (CGFloat)centerX;
- (void)setCenterX:(CGFloat)x;

/**
 * 中心点y
 */
- (CGFloat)centerY;
- (void)setCenterY:(CGFloat)y;

/**
 起始点
 */
- (CGPoint)origin;
- (void)setOrigin:(CGPoint)origin;

/**
 size大小
 */
- (CGSize)size;
- (void)setSize:(CGSize)size;

/**
 * 获取最大x
 */
- (CGFloat)maxX;
/**
 * 获取最小x
 */
- (CGFloat)minX;

/**
 * 获取最大y
 */
- (CGFloat)maxY;
/**
 * 获取最小y
 */
- (CGFloat)minY;

@end
