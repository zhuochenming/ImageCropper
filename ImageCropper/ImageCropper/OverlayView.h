//
//  OverlayView.h
//  ImageCropper
//
//  Created by Zhuochenming on 16/1/8.
//  Copyright © 2016年 Zhuochenming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OverlayView : UIView
//基准透明区域，不可赋初始值
@property (nonatomic, assign) CGRect clearRect;

//拐角
@property (nonatomic, assign, readonly) CGRect topLeftCorner;
@property (nonatomic, assign, readonly) CGRect topRightCorner;
@property (nonatomic, assign, readonly) CGRect bottomLeftCorner;
@property (nonatomic, assign, readonly) CGRect bottomRightCorner;

//边缘
@property (nonatomic, assign, readonly) CGRect topEdgeRect;
@property (nonatomic, assign, readonly) CGRect rightEdgeRect;
@property (nonatomic, assign, readonly) CGRect bottomEdgeRect;
@property (nonatomic, assign, readonly) CGRect leftEdgeRect;

//透明区域数组
@property (nonatomic, strong) NSMutableArray *rectArray;

//焦点透明区域(当前激活的透明区域)
@property (nonatomic, assign) NSInteger whichRect;

@property (nonatomic, assign) CGSize maxSize;

- (BOOL)isCornerContainsPoint:(CGPoint)point;

- (BOOL)isEdgeContainsPoint:(CGPoint)point;

- (BOOL)isInRectPoint:(CGPoint)point;

@end
