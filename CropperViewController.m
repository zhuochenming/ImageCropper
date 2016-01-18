//
//  CropperViewController.m
//  封装
//
//  Created by 酌晨茗 on 16/1/8.
//  Copyright © 2016年 酌晨茗. All rights reserved.
//

#import "CropperViewController.h"
#import "CropperView.h"

@interface CropperViewController ()

@property (nonatomic, strong) CropperView *imageCropperView;

@end

@implementation CropperViewController

- (id)initWithImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.title = @"裁减";
        self.imageCropperView = [[CropperView alloc] initWithFrame:self.view.bounds image:[UIImage imageNamed:@"a"] rectArray:@[NSStringFromCGRect(CGRectMake(0, 0, 100, 100)), NSStringFromCGRect(CGRectMake(150, 0, 100, 100))]];
//        [self.imageCropperView setConstrain:CGSizeMake(30, 10)];
        [self.view addSubview:self.imageCropperView];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction)];
    }
    return self;
}

- (void)cancelAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)doneAction {
    if (self.doneBlock) {
        self.doneBlock([self.imageCropperView cropedImageArray]);
    }
    [self.navigationController popViewControllerAnimated:YES];
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
