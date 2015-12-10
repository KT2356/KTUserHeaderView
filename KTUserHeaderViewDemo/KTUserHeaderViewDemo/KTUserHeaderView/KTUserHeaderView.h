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
- (void)KTUserHeaderImageDidChanged:(UIImage *)newImage;
@end

@interface KTUserHeaderView : UIImageView
@property (nonatomic, weak) id <KTUserHeaderViewDelegate> delegate;

//初始化
- (instancetype)initInSuperView:(UIView *)superView
             withPlaceholderImg:(UIImage *)placeholder
              webImageUrlString:(NSString *)imgUrlString;

//设置边框
- (void)setUserImageBourderColor:(UIColor *)color Width:(float)width;
@end
