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
    
    //------
    _userIcon = [[KTUserHeaderView alloc] initInSuperView:self.superView
                                       withPlaceholderImg:[UIImage imageNamed:@"placeholder"]
                                              webImageUrlString:@"http://pic2.nipic.com/20090506/1055421_080356081_2.jpg"];
    _userIcon.delegate = self;
    [_userIcon setUserImageBourderColor:[UIColor redColor] Width:1.5];
    //------
    
}

- (void)KTUserHeaderImageDidChanged:(UIImage *)newImage {
    NSLog(@"imageChange : %@",newImage);
}

@end
