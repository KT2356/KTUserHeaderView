//
//  ViewController.m
//  KTUserHeaderViewDemo
//
//  Created by KT on 15/12/10.
//  Copyright © 2015年 KT. All rights reserved.
//

#import "ViewController.h"
#import "KTUserHeaderView.h"

@interface ViewController ()<KTUserHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *superView;
@property (nonatomic, strong) KTUserHeaderView *userIcon;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    //------
    _userIcon = [[KTUserHeaderView alloc] initInSuperView:self.superView withImageUrl:[NSURL URLWithString:@""]];
    _userIcon.delegate = self;
    [_userIcon setUserImageBourderColor:[UIColor redColor] Width:1.5];
    //------
    
}

- (void)KTUserHeaderImageDidChanged:(UIImage *)newImage {
    NSLog(@"%@",newImage);
}

@end
