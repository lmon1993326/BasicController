//
//  NSString+CYCustom.m
//  ztcj
//
//  Created by wisegeek2 on 16/9/8.
//  Copyright © 2016年 Wisegeek. All rights reserved.
//

#import "NSString+CYCustom.h"

@implementation NSString (CYCustom)


#pragma mark - 日期和字符串转化
/*=====================================================================*/
/*----返回date根据string----*/
-(NSDate *)getDateFormat:(NSString *)format
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    inputFormatter.timeZone = [NSTimeZone defaultTimeZone];
    [inputFormatter setDateFormat:format];
    NSDate *date = [inputFormatter dateFromString:self];
    
    return date;
}

-(NSString *)getStringFormat:(NSString *)format selfFormat:(NSString *)selfFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone defaultTimeZone];
    [formatter setDateFormat: selfFormat];
    NSDate *date = [formatter dateFromString:self];
    [formatter setDateFormat: format];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}
/*=====================================================================*/

#pragma mark - 判断是否纯数字字符
- (BOOL)isAllNumChar
{
    
    for (int i = 0; i < self.length; i ++) {
        unichar ch = [self characterAtIndex:i];
        if (ch < '0' || ch > '9') {
            return NO;
        }
    }
    
    return YES;
}

#pragma mark - 返回字符串的自适应宽度width
-(CGFloat)getWidthFontSize:(CGFloat)fontSize
{
    return [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, fontSize) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} context:NULL].size.width;
}

#pragma mark - 返回字符串的自适应高度height
-(CGFloat)getHeightFont:(UIFont *)font width:(CGFloat)width
{
    return ceilf([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:NULL].size.height);
}

//计算UILabel的高度（带有段间距和缩进的情况）
-(CGFloat)getSpaceLabelHeightWithFont:(UIFont *)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace firstLineHeadIndent:(CGFloat)firstLineHeadIndent paragraphSpacing:(CGFloat)paragraphSpacing
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = firstLineHeadIndent;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    paraStyle.paragraphSpacingBefore = paragraphSpacing;
    
    
    NSDictionary *dic = @{
                          NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle,
                          //                          NSKernAttributeName:@1.5f // 字间距
                          };
    
    return ceilf([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:NULL].size.height);
}

//计算UILabel的高度(带有行间距的情况)
-(CGFloat)getSpaceLabelHeightWithFont:(UIFont *)font withWidth:(CGFloat)width lineSpace:(CGFloat)lineSpace
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    
   
    NSDictionary *dic = @{
                          NSFontAttributeName:font,
                          NSParagraphStyleAttributeName:paraStyle,
//                          NSKernAttributeName:@1.5f // 字间距
                          };
    
    return ceilf([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:NULL].size.height);
}


#pragma mark- 判断：手机号格式
-(BOOL)isValidateMobilePhoneNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[019])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

- (NSAttributedString *)markKeyword:(NSString *)keyword color1:(UIColor *)color1 font1:(UIFont *)font1 color2:(UIColor *)color2 font2:(UIFont *)font2
{
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]init];
    NSArray *strArr = [self componentsSeparatedByString:keyword];
    
    for (NSString *str in strArr) {
        
        NSAttributedString *subAttributeStr1 = [[NSAttributedString alloc]initWithString:str attributes:@{NSFontAttributeName:font1,NSForegroundColorAttributeName:color1}];
        [attributeStr appendAttributedString:subAttributeStr1];
        
        if (str != strArr.lastObject) {

            NSAttributedString *subAttributeStr2 = [[NSAttributedString alloc]initWithString:keyword attributes:@{NSFontAttributeName:font2,NSForegroundColorAttributeName:color2}];
            [attributeStr appendAttributedString:subAttributeStr2];
        }
    }
    
    return attributeStr;
}


@end
