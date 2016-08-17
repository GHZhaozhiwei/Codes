//
//  GHJiuGongGeView.m
//  创建九宫格
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GHJiuGongGeView.h"

#define Screen_width [UIScreen mainScreen].bounds.size.width

@interface GHButton : UIButton

@end
@implementation GHButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat imageX = contentRect.size.width * 0.25;
    CGFloat imageHeight = contentRect.size.height * 0.5 ;
    CGFloat imageY = contentRect.size.height * 0.2 ;
    CGFloat imageWidth = contentRect.size.width * 0.5;
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * 0.2;
    CGFloat titleY = contentRect.size.height - titleHeight * 1.4;
    CGFloat titleWidth = contentRect.size.width;
    return  CGRectMake(titleX, titleY, titleWidth, titleHeight);
}


@end
@interface GHJiuGongGeView()

@property (nonatomic , assign)CGRect buttonFrame;

@property (nonatomic , assign)NSInteger buttonLine;
/// 每一行button的个数
@property (nonatomic , assign)NSInteger buttonColumn;
/// 横向的空间
@property (nonatomic , assign)CGFloat buttonMarginX;
/// 纵向的空间
@property (nonatomic , assign)CGFloat buttonMarginY;
/// 按钮的高度
@property (nonatomic , assign)CGFloat buttonH;

@end
@implementation GHJiuGongGeView
+ (instancetype)jiuGongGeViewWithFrame:(CGRect)frame; {
    
    GHJiuGongGeView *jiugongge = [[GHJiuGongGeView alloc]initWithFrame:frame];

    return jiugongge;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    /// 按钮之间的(横向)距离
    CGFloat marginX = self.buttonMarginX;
    
    /// 按钮之间的(纵向)距离
    CGFloat marginY = self.buttonMarginY;
    
    /// 动态计算按钮的宽度
    CGFloat w = (Screen_width - marginX * (self.buttonColumn + 1)) / self.buttonColumn;
    /// 按钮的高度
    CGFloat h = self.buttonH;
    for (NSInteger index = 0; index < self.imagesArray.count; index++) {
        GHButton *button = [[GHButton alloc]init];
        NSLog(@"%@",self.imagesArray[index][@"icon"]);
        // 计算每一个格子的行索引
        NSInteger row = index / self.buttonColumn;
        // 计算当前格子所在列的索引
        NSInteger col = index % self.buttonColumn;
        
        CGFloat x = marginX + col * (w + marginX);
        CGFloat y = marginY + row * (h + marginY);
        button.layer.borderWidth = 0.5;
        button.frame = CGRectMake(x, y, w, h);
        [button setTitle:self.imagesArray[index][@"name"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:self.imagesArray[index][@"icon"]] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.tag = index;
        [button addTarget:self action:@selector(clickButtons:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        [self addSubview:button];
    }
}

- (void)clickButtons:(UIButton *)button {
    if (self.selected) {
        self.selected(button,button.tag);
    }
}
- (GHJiuGongGeView *(^)())array {
    return ^GHJiuGongGeView *(NSArray *buttonArray){
        _imagesArray = buttonArray;
        return self;
    };
}

- (GHJiuGongGeView *(^)(CGFloat marginX))marginX {
    GHJiuGongGeView *(^block)(CGFloat marginX)  = ^(CGFloat marginX){
        _buttonMarginX = marginX;
        return self;
    };
    return block;
}
- (GHJiuGongGeView *(^)(CGFloat marginY))marginY {
    GHJiuGongGeView *(^block)(CGFloat marginY)  = ^(CGFloat marginY){
        _buttonMarginY = marginY;
        return self;
    };
    return block;
}

- (GHJiuGongGeView *(^)())column {
    return ^GHJiuGongGeView *(NSInteger column) {
        _buttonColumn = column;
        return self;
    };
}

- (GHJiuGongGeView *(^)(CGFloat h))h {
    GHJiuGongGeView *(^block)(CGFloat h)  = ^(CGFloat h){
        _buttonH = h;
        return self;
    };
    return block;
}
@end

