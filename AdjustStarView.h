//
//  AdjustStarView.h
//  明演副本
//
//  Created by Apple on 16/8/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdjustStarViewDelegate <NSObject>

-(void)getScore:(NSInteger)score lines:(NSInteger)lines;

@end

@interface AdjustStarView : UIView

@property (nonatomic,weak)id <AdjustStarViewDelegate> delegate;

@property (nonatomic,strong)UIButton *star1;
@property (nonatomic,strong)UIButton *star2;
@property (nonatomic,strong)UIButton *star3;
@property (nonatomic,strong)UIButton *star4;
@property (nonatomic,strong)UIButton *star5;

-(void)setScore:(NSInteger)score;

@end
