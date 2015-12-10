//
//  KTUserHeaderView.m
//  KTUserHeaderViewDemo
//
//  Created by KT on 15/12/10.
//  Copyright © 2015年 KT. All rights reserved.
//

#import "KTUserHeaderView.h"
@interface KTUserHeaderView ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@end
@implementation KTUserHeaderView

#pragma mark - public methods
- (instancetype)initInSuperView:(UIView *)superView withImageUrl:(NSURL *)imageURL {
    self = [super initWithFrame:superView.frame];
    if (self) {
        [self addGesture];
        [self setupLayerView];
        [superView addSubview:self];
        [self addConstraintInSuperView:superView];
        
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
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.frame.size.width/2;
    self.layer.backgroundColor = [[UIColor grayColor] CGColor];
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.5f;
}

- (void)addConstraintInSuperView:(UIView *)superView {
    superView.backgroundColor = [UIColor clearColor];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSArray *constraints1=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[self]-0-|"options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
    NSArray *constraints2=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[self]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(self)];
    [superView addConstraints:constraints1];
    [superView addConstraints:constraints2];
}

//点击手势
- (void)addGesture {
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userHeaderTappedAction)];
    [self addGestureRecognizer:tapped];
}

-(void)addCarema {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.window.rootViewController presentViewController: picker animated:YES completion:nil];
        
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"系统提示" message:@"摄像头打开失败！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
}

- (void)showPicker {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    [self.window.rootViewController presentViewController:picker animated:YES completion:nil];
}

- (void)userHeaderTappedAction {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"拍一张" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self addCarema];
    }];
    UIAlertAction *choosePhoto = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showPicker];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:archiveAction];
    [alertController addAction:choosePhoto];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
}

//图像转base64
- (NSString *)base64ImageStr:(UIImage *)image {
    NSString *base64Str = [UIImageJPEGRepresentation(image,0.5)
                           base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64Str;
}


#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //修改imagePicker bar 的颜色
    if([navigationController isKindOfClass:[UIImagePickerController class]]) {
       // navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
        navigationController.navigationBar.backgroundColor = self.window.rootViewController.navigationController.navigationBar.backgroundColor;
    }
}
# pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController  *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *myimage =  [info objectForKey:UIImagePickerControllerOriginalImage];
    [self setImage:myimage];
    [self.delegate KTUserHeaderImageDidChanged:myimage];
}

@end
