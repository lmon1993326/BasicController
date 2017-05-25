//
//  NSString+CYCustom.h
//  ztcj
//
//  Created by wisegeek2 on 16/9/8.
//  Copyright © 2016年 Wisegeek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (getDate)


#pragma mark - 日期和字符串转化：设置特色菜
/*----返回date根据string----*/
- (NSDate *)getDateFormat:(NSString *)format;

#pragma mark - 获取日期字符串: 根据格式如(yyyyMMddHHmmss)
-(NSString *)getStringFormat:(NSString *)format selfFormat:(NSString *)selfFormat;

#pragma mark - 判断是否纯数字字符
- (BOOL)isAllNumChar;


#pragma mark - 返回字符串的自适应宽度width
-(CGFloat)getWidthFontSize:(CGFloat)fontSize;

#pragma mark - 返回字符串的自适应高度height
-(CGFloat)getHeightFont:(UIFont *)font width:(CGFloat) width;

//计算UILabel的高度（带有段间距和缩进的情况）
-(CGFloat)getSpaceLabelHeightWithFont:(UIFont *)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace firstLineHeadIndent:(CGFloat)firstLineHeadIndent paragraphSpacing:(CGFloat)paragraphSpacing;

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeightWithFont:(UIFont*)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace;

#pragma mark- 判断：手机号格式
- (BOOL)isValidateMobilePhoneNum;

#pragma mark - 根据关键字标红
- (NSAttributedString *)markKeyword:(NSString *)keyword color1:(UIColor *)color1 font1:(UIFont *)font1 color2:(UIColor *)color2 font2:(UIFont *)font2;

@end
