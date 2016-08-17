//
//  GHJiuGongGeView.h
//  创建九宫格
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHJiuGongGeView : UIView
@property (nonatomic , strong) NSArray *buttonsArray;
@property (nonatomic , strong) NSArray *imagesArray;
@property (nonatomic , copy) void(^selected)(UIButton *button,NSInteger index);

+ (instancetype)jiuGongGeViewWithFrame:(CGRect)frame;


/// 数组
- (GHJiuGongGeView *(^)())array;
/// 距离两边的距离
- (GHJiuGongGeView *(^)(CGFloat marginX))marginX;
/// 距离顶部的距离
- (GHJiuGongGeView *(^)(CGFloat marginY))marginY;
/// 要创建几列
- (GHJiuGongGeView *(^)())column;

- (GHJiuGongGeView *(^)(CGFloat h))h;
@end
