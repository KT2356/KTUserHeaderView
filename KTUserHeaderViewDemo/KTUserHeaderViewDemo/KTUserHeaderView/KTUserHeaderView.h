//
//  KTUserHeaderView.h
//  KTUserHeaderViewDemo
//
//  Created by KT on 15/12/10.
//  Copyright © 2015年 KT. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol KTUserHeaderViewDelegate <NSObject>
@optional
- (void)KTUserHeaderImageDidChanged:(NSURL *)newImageURL;
@end

@interface KTUserHeaderView : UIView
@property (nonatomic, weak) id <KTUserHeaderViewDelegate> delegate;

- (instancetype)initInSuperView:(UIView *)superView withImageUrl:(NSURL *)imageURL;
- (void)setUserImageBourderColor:(UIColor *)color Width:(float)width;
@end
