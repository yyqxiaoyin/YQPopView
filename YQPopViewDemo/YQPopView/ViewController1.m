//
//  ViewController1.m
//  YQPopView
//
//  Created by 尹永奇 on 16/4/27.
//  Copyright © 2016年 yyqxiaoyin. All rights reserved.
//

#import "ViewController1.h"
#import "YQPopView.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"显示" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
}

-(void)btnClick{
    NSArray *titles = @[@"发起群聊",@"添加朋友",@"扫一扫",@"收付款"];
    
    [[YQPopView sharePopView ]showPopViewWithTitles:titles action:^(NSInteger index) {
        
        NSLog(@"点击了第%lu个 :%@",index,titles[index]);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
