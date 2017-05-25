//
//  UILabel+CYCustom.m
//  ztcj
//
//  Created by wisegeek2 on 16/9/23.
//  Copyright © 2016年 Wisegeek. All rights reserved.
//

#import "UILabel+CYCustom.h"

@implementation UILabel (CYCustom)

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{
                          NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle,
//                          NSKernAttributeName:@1.5f //设置字间距 @1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    self.attributedText = attributeStr;
}

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)lineBreakMode firstLineHeadIndent:(CGFloat)firstLineHeadIndent paragraphSpacing:(CGFloat)paragraphSpacing
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = lineBreakMode;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = firstLineHeadIndent;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    paraStyle.paragraphSpacingBefore = paragraphSpacing;
    
    NSDictionary *dic = @{
                          NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle,
                          //                          NSKernAttributeName:@1.5f //设置字间距 @1.5f
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    self.attributedText = attributeStr;
}

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace rangeTextColor:(UIColor *)rangecolor range:(NSRange)range
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail; // 超出部分省略号显示
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
    NSDictionary *dic = @{
                          NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle,
                          //                          NSKernAttributeName:@1.5f //设置字间距 @1.5f
                          };
    
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc]initWithString:str attributes:dic];
    [attriStr addAttribute:NSForegroundColorAttributeName value:rangecolor range:range];
    
    self.attributedText = attriStr;
}


-(void)setStockUpdowncolorWithText:(NSString *)text
{
    self.text = text;
    
    CGFloat value = text.floatValue;
    if (value < 0) {
        self.textColor = [UIColor blackColor];
    }
    else if (value > 0){
        self.textColor = [UIColor blackColor];
    }
    else{
        self.textColor = [UIColor redColor];
    }
}

@end
