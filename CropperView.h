//
//  CropperView.h
//  封装
//
//  Created by 酌晨茗 on 16/1/8.
//  Copyright © 2016年 酌晨茗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CropperView : UIView

@property (nonatomic, strong) UIImage *image;

//初始化
- (instancetype)initWithFrame:(CGRect)frame
              image:(UIImage *)image
          rectArray:(NSArray *)rectArray;

//截图
- (NSArray *)cropedImageArray;

//- (void)getClearRect;
//
//- (void)square;
//
//网格大小比例
//- (void)setConstrain:(CGSize)size;

@end
