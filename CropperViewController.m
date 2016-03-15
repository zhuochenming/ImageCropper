//
//  CropperViewController.m
//  封装
//
//  Created by 酌晨茗 on 16/1/8.
//  Copyright © 2016年 酌晨茗. All rights reserved.
//

#import "CropperViewController.h"
#import "CropperView.h"

#define bottomViewHeight 60

@interface CropperViewController ()

@property (nonatomic, strong) CropperView *imageCropperView;

@property (nonatomic, assign) BOOL flag;

@property (nonatomic, assign) CGRect rect;

@end

@implementation CropperViewController

- (id)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.title = @"裁减";
        _flag = YES;
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
        CGFloat left = 50;
        CGFloat cropWidth = ScreenWidth - left * 2.0;
        CGRect rect = CGRectMake(left, (screenHeight - bottomViewHeight) / 2.0 - 100, cropWidth, 100);
        _rect = rect;
        
        self.imageCropperView = [[CropperView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight - bottomViewHeight) image:image rectArray:@[NSStringFromCGRect(rect)]];
//        [self.imageCropperView setConstrain:CGSizeMake(30, 10)];
        [self.view addSubview:_imageCropperView];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight - bottomViewHeight, screenWidth, bottomViewHeight)];
        bottomView.backgroundColor = RGBA(0, 0, 0, 0.6);
        bottomView.userInteractionEnabled = YES;
        
        CGFloat buttonTop = 10;
        CGFloat buttonHeight = bottomViewHeight - buttonTop * 2;
        
        UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleButton.frame = CGRectMake(0, buttonTop, 100, buttonHeight);
        [cancleButton addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
        cancleButton.backgroundColor = [UIColor clearColor];
        [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomView addSubview:cancleButton];
 
        CGFloat imageButtonWidth = (screenWidth - 100 - 30) / 2.0;
        
        UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addButton.frame = CGRectMake(CGRectGetMaxX(cancleButton.frame) + 10, buttonTop, imageButtonWidth, buttonHeight);
        [addButton addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
        addButton.backgroundColor = [UIColor clearColor];
        [addButton setImage:[UIImage imageNamed:@"chapter_plus_green"] forState:UIControlStateNormal];
        [addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomView addSubview:addButton];
        
        UIButton *photoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        photoButton.frame = CGRectMake(CGRectGetMaxX(addButton.frame) + 10, buttonTop, imageButtonWidth, buttonHeight);
        [photoButton addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchUpInside];
        photoButton.backgroundColor = [UIColor clearColor];
        [photoButton setImage:[UIImage imageNamed:@"cut"] forState:UIControlStateNormal];
        [photoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [bottomView addSubview:photoButton];
        
        [self.view addSubview:bottomView];
    }
    return self;
}

- (void)cancle {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)add:(UIButton *)button {
    if (_flag) {
        [button setImage:[UIImage imageNamed:@"reduce"] forState:UIControlStateNormal];        
        [_imageCropperView addCropRect:CGRectMake(CGRectGetMinX(_rect), CGRectGetMaxY(_rect) + 10, CGRectGetWidth(_rect), CGRectGetHeight(_rect))];
    } else {
        [button setImage:[UIImage imageNamed:@"chapter_plus_green"] forState:UIControlStateNormal];
        [_imageCropperView removeCropRectByIndex:1];
    }
    _flag = !_flag;
}

- (void)photo {
    if (self.doneBlock) {
        self.doneBlock([self.imageCropperView cropedImageArray]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)done:(CroppedBlock)done {
    self.doneBlock = done;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
