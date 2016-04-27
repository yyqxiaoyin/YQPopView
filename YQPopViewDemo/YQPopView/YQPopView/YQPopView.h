//
//  YQPopView.h
//  YQPopView
//
//  Created by 尹永奇 on 16/4/26.
//  Copyright © 2016年 yyqxiaoyin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tableViewClickBlock)(NSInteger index);

@interface YQPopView : UIView

+(instancetype)sharePopView;

-(void)showPopViewWithTitles:(NSArray *)titles action:(tableViewClickBlock)block;



@end
