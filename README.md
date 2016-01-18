# ImageCropper
多个剪切框来截取图片

引入头文件#import "CropperViewController.h"

    CropperViewController *crop = [[CropperViewController alloc] initWithImage:[UIImage imageNamed:@"a"]];
    
    UIView *buttomView = [UIView new];
    buttomView.frame = [UIScreen mainScreen].bounds;
    buttomView.backgroundColor = [UIColor whiteColor];
    
    [crop done:^(NSArray *imageArray) {
        for (int i = 0; i < imageArray.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:imageArray[i]];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            imageView.frame = CGRectMake(0, 110 * i, CGRectGetWidth(self.view.frame), 100);
            [buttomView addSubview:imageView];
        }
        [self.view addSubview:buttomView];
        
        [self performSelector:@selector(removeView:) withObject:buttomView afterDelay:3];

    }];
    
    [self.navigationController pushViewController:crop animated:YES];
    
(https://github.com/ZhuoChenMing/ImageCropper/blob/master/sc.png)
