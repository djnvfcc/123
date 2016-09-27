//
//  AdjustStarView.m
//  明演副本
//
//  Created by Apple on 16/8/11.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "AdjustStarView.h"

@interface AdjustStarView ()
@property (nonatomic,assign)NSInteger lastScore;
@end

@implementation AdjustStarView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat gapW = 0, gapH = 0;
        if (frame.size.width >= 200 * kProportionWidth) {
            gapW = (frame.size.width - 200* kProportionWidth) / 2;
        }
        if (frame.size.height >= 30 * kProportionHeight) {
            gapH = (frame.size.height - 30 * kProportionHeight) / 2;
        }
        
        self.star1 = [[UIButton alloc]initWithFrame:CGRectMake(gapW, gapH, 30 * kProportionWidth, 30 * kProportionHeight)];
        self.star1.tag = 100;
        [self.star1 setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        [self.star1 addTarget:self action:@selector(doSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.star1];
        
        self.star2 = [[UIButton alloc]initWithFrame:CGRectMake(gapW + 40 * kProportionWidth, gapH, 30 * kProportionWidth, 30 * kProportionHeight)];
        self.star2.tag = 101;
        [self.star2 setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        [self.star2 addTarget:self action:@selector(doSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.star2];
        
        self.star3 = [[UIButton alloc]initWithFrame:CGRectMake(gapW + 80 * kProportionWidth, gapH, 30 * kProportionWidth, 30 * kProportionHeight)];
        self.star3.tag = 102;
        [self.star3 setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        [self.star3 addTarget:self action:@selector(doSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.star3];
        
        self.star4 = [[UIButton alloc]initWithFrame:CGRectMake(gapW + 120 * kProportionWidth, gapH, 30 * kProportionWidth, 30 * kProportionHeight)];
        self.star4.tag = 103;
        [self.star4 setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        [self.star4 addTarget:self action:@selector(doSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.star4];
        
        self.star5 = [[UIButton alloc]initWithFrame:CGRectMake(gapW + 160 * kProportionWidth, gapH, 30 * kProportionWidth, 30 * kProportionHeight)];
        self.star5.tag = 104;
        [self.star5 setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        [self.star5 addTarget:self action:@selector(doSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.star5];
    }
    return self;
}

-(void)doSelected:(UIButton *)sender
{
    if (self.delegate == nil) {
        return;
    }
    
    NSInteger score = sender.tag - 99;
    NSLog(@"%ld",score);
    if (score > self.lastScore) {
        for (NSInteger i = self.lastScore + 1; i <= score; i++) {
            UIButton *button = (UIButton *)[self viewWithTag:i + 99];
            [button setBackgroundImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateNormal];
        }
    }
    else if (score < self.lastScore)
    {
        for (NSInteger i = score + 1; i <= self.lastScore; i++) {
            UIButton *button = (UIButton *)[self viewWithTag:i + 99];
            [button setBackgroundImage:[UIImage imageNamed:@"starUnselected"] forState:UIControlStateNormal];
        }
    }
    [self.delegate getScore:score lines:self.tag - 1000];
    self.lastScore = score;
}

-(void)setScore:(NSInteger)score
{
    for (NSInteger i = 1; i <= score; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:i + 99];
        [button setBackgroundImage:[UIImage imageNamed:@"starSelected"] forState:UIControlStateNormal];
    }
}


@end
