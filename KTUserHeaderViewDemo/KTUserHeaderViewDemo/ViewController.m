//
//  ViewController.m
//  KTUserHeaderViewDemo
//
//  Created by KT on 15/12/10.
//  Copyright © 2015年 KT. All rights reserved.
//

#import "ViewController.h"
#import "KTUserHeaderView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *superView;
@property (nonatomic, strong) KTUserHeaderView *userIcon;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    _userIcon = [[KTUserHeaderView alloc] initInSuperView:self.superView withImageUrl:[NSURL URLWithString:@""]];
    [_userIcon setUserImageBourderColor:[UIColor redColor] Width:1.5];
    self.superView.backgroundColor = [UIColor greenColor];
    [self addGesture];

    
}
- (void)addGesture {
    self.superView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userHeaderTappedAction)];
    [self.superView addGestureRecognizer:tapped];
}




- (void)userHeaderTappedAction {
    NSLog(@"2");
}

@end
