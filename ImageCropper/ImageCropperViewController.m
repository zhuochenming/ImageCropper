//
//  ImageCropperViewController.m
//  ImageCropper
//
//  Created by Zhuochenming on 2017/1/3.
//  Copyright © 2017年 Zhuochenming. All rights reserved.
//

#import "ImageCropperViewController.h"
#import "CropperViewController.h"

@interface ImageCropperViewController ()

@end

@implementation ImageCropperViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多裁切框裁剪图片";
    
    CGFloat imageHeight = (self.view.frame.size.height - 150) / 2.0;
    for (NSInteger i = 0; i < 2; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30 + (imageHeight + 10) * i, self.view.frame.size.width - 20, imageHeight)];
        imageView.tag = 1000 + i;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:imageView];
    }

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    
    UIView *imageView = [self.view viewWithTag:1001];
    button.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 100) / 2.0, CGRectGetMaxY(imageView.frame) + 30, 100, 30);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonTocuh) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonTocuh {
    CropperViewController *crop = [CropperViewController new];
    crop.image = [UIImage imageNamed:@"a.jpg"];
    
    __weak typeof(self) weakSelf = self;
    [crop done:^(NSArray *imageArray) {
        for (NSInteger i = 0; i < imageArray.count; i++) {
            UIImageView *imageView = [weakSelf.view viewWithTag:1000 + i];
            imageView.image = imageArray[i];
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.navigationController pushViewController:crop animated:YES];
}

- (void)removeView:(UIView *)view {
    [view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
