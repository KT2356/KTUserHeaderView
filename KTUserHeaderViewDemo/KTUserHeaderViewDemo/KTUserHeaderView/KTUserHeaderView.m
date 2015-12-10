//
//  KTUserHeaderView.m
//  KTUserHeaderViewDemo
//
//  Created by KT on 15/12/10.
//  Copyright © 2015年 KT. All rights reserved.
//

#import "KTUserHeaderView.h"

@implementation KTUserHeaderView

#pragma mark - public methods
- (instancetype)initInSuperView:(UIView *)superView withImageUrl:(NSURL *)imageURL {
    self = [super initWithFrame:superView.frame];
    if (self) {
        superView.backgroundColor = [UIColor clearColor];
        //[self setupLayerView];
        [self addGesture];
        [superView addSubview:self];
        
  

        self.translatesAutoresizingMaskIntoConstraints=NO;

        NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|"options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
        
        NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
        
        [superView addConstraints:constraints1];
        [superView addConstraints:constraints2];
  
        [self setupLayerView];
    }
    return self;
}

//设置边框
- (void)setUserImageBourderColor:(UIColor *)color Width:(float)width{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = width;
}

#pragma mark - private methods
//设置layer
- (void)setupLayerView {
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.backgroundColor = [[UIColor grayColor] CGColor];
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0f;
}

//点击手势
- (void)addGesture {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userHeaderTappedAction)];
    [self addGestureRecognizer:tapped];
}

- (void)addCarema {
    
}

- (void)showPicker {
    
}

- (void)userHeaderTappedAction {
    NSLog(@"1");
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self addCarema];
//    }];
//    
//    UIAlertAction *choosePhoto = [UIAlertAction actionWithTitle:@"选取照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [self showPicker];
//    }];
//    
//    [alertController addAction:cancelAction];
//    
//    [alertController addAction:archiveAction];
//    [alertController addAction:choosePhoto];
//    
//    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

@end
