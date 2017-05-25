//
//  UILabel+CYCustom.h
//  ztcj
//
//  Created by wisegeek2 on 16/9/23.
//  Copyright © 2016年 Wisegeek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CYCustom)

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace;

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace lineBreakMode:(NSLineBreakMode)lineBreakMode firstLineHeadIndent:(CGFloat)firstLineHeadIndent paragraphSpacing:(CGFloat)paragraphSpacing;

-(void)setLabelSpaceWithText:(NSString*)str withFont:(UIFont*)font lineSpacing:(CGFloat)lineSpace rangeTextColor:(UIColor *)rangecolor range:(NSRange)range;

-(void)setStockUpdowncolorWithText:(NSString *)text;

@end
