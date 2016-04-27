//
//  ViewController.m
//  YQPopView
//
//  Created by 尹永奇 on 16/4/26.
//  Copyright © 2016年 yyqxiaoyin. All rights reserved.
//

#import "ViewController.h"
#import "YQPopView.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    
    [[YQPopView sharePopView ]showPopViewWithTitles:titles action:^(NSInteger index) {
       
        NSLog(@"点击了第%lu个 :%@",index,titles[index]);
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
