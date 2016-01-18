//
//  CropperViewController.h
//  封装
//
//  Created by 酌晨茗 on 16/1/8.
//  Copyright © 2016年 酌晨茗. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CroppedBlock)(NSArray *imageArray);

@interface CropperViewController : UIViewController

@property (nonatomic, copy) CroppedBlock doneBlock;

- (id)initWithImage:(UIImage *)image;

- (void)done:(CroppedBlock)done;

@end
