//
//  ViewController.m
//  创建九宫格
//
//  Created by apple on 16/8/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "GHJiuGongGeView.h"


@interface ViewController ()
@property (nonatomic , strong)NSArray *imagesArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /// 创建对象
    GHJiuGongGeView *jiugongge = [GHJiuGongGeView jiuGongGeViewWithFrame:self.view.bounds];
    
    /// 初始化
    //***************************** 数组和有几列是必传参数
    jiugongge.array(self.imagesArray).marginX(0).marginY(0).column(4).h(100);
    
    /// 点击事件
    jiugongge.selected = ^(UIButton *button,NSInteger index) {
        NSLog(@"点击了第%ld个按钮",(long)index);
    };
    [self.view addSubview:jiugongge];
}


- (NSArray *)imagesArray {
    if (_imagesArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        _imagesArray = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _imagesArray;
}
@end
