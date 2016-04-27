//
//  YQPopView.m
//  YQPopView
//
//  Created by 尹永奇 on 16/4/26.
//  Copyright © 2016年 yyqxiaoyin. All rights reserved.
//

#import "YQPopView.h"


#define TABLEVIEW_CELL_HEIGHT 40
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TABLEVIEW_WIDTH SCREEN_WIDTH/3

@interface YQPopView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,copy) tableViewClickBlock block;

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,strong)NSArray *titles;

@end
YQPopView *bgView;

@implementation YQPopView

+(instancetype)sharePopView{

    static YQPopView *popView = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        popView = [[self alloc] init];
        
    });
    return popView;
    
}
- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        
    }
    return self;
}

-(void)showPopViewWithTitles:(NSArray *)titles action:(tableViewClickBlock)block{
    
    self.titles = titles;
    
    [self setUpBgViewWithBlock:block];
    
    [self setUpTableView];
    
}

-(void)setUpTableView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - TABLEVIEW_WIDTH -10,
                                                                  64+20,
                                                                  TABLEVIEW_WIDTH,
                                                                  self.titles.count *TABLEVIEW_CELL_HEIGHT) style:0];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setScrollEnabled:NO];
    CALayer *layer = [self.tableView layer];
    CGPoint oldAnchorPoint = layer.anchorPoint;
    [layer setAnchorPoint:CGPointMake(1.0, 0)];
    [layer setPosition:CGPointMake(layer.position.x +layer.bounds.size.width *(layer.anchorPoint.x - oldAnchorPoint.x),
                                   layer.position.y + layer.bounds.size.height * (layer.anchorPoint.y - oldAnchorPoint.y))];
    self.tableView.transform =CGAffineTransformMakeScale(0.0001, 0.0001);
    [window addSubview:self.tableView];
    
    [UIView animateWithDuration:0.15 animations:^{
        
        bgView.alpha = 1;
        self.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];

}

-(void)setUpBgViewWithBlock:(tableViewClickBlock)block{

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    bgView = [YQPopView sharePopView];
    bgView.frame = window.bounds;
    bgView.backgroundColor = [UIColor colorWithHue:0
                                        saturation:0
                                        brightness:0
                                             alpha:0.1];
    bgView.alpha = 0;
    bgView.block = block;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bgViewTap)];
    bgView.userInteractionEnabled = YES;
    [bgView addGestureRecognizer:tap];
    
    [window addSubview:bgView];
    
}

-(void)bgViewTap{

    [self hidePopView];

}

-(void)hidePopView{

    [UIView animateWithDuration:0.3 animations:^{
       
        bgView.alpha = 0;
        self.tableView.transform = CGAffineTransformMakeScale(0.000001, 0.0001);
        
    } completion:^(BOOL finished) {
        
        self.tableView.delegate = nil;
        self.tableView.dataSource = nil;
        self.tableView = nil;
        [self.tableView removeFromSuperview];
        [bgView removeFromSuperview];
        
        
    }];
}

#pragma mark tableviewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titles.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return TABLEVIEW_CELL_HEIGHT;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell.contentView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [obj removeFromSuperview];
    }];
    
    cell.textLabel.text = self.titles[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14*SCREEN_WIDTH/320];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.block) {
        self.block(indexPath.row);
    }
}

- (void)drawRect:(CGRect)rect {

    [[UIColor whiteColor] set];
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGFloat location = [UIScreen mainScreen].bounds.size.width;
    CGContextMoveToPoint(context,
                         location -  10 - 10, 64 + 20);
    
    CGContextAddLineToPoint(context,
                            location - 2*10 - 10 ,  64 +10);
    
    CGContextAddLineToPoint(context,
                            location - 10 * 3 - 10, 64 + 20);
    
    CGContextClosePath(context);
    
    [[UIColor whiteColor] setFill];
    
    [[UIColor whiteColor] setStroke];
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);
}


@end
