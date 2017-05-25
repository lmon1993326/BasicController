//
//  UICOLOR.h
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BACKGROUND_COLOR UIColorFromRGB(0xf1f1f1)
#define COLOR_GREEN UIColorFromRGB(0x58c962)
#define COLOR_LIGHT_GREEN UIColorFromRGB(0x9ad855)
#define COLOR_LIGHT_BLUE UIColorFromRGB(0x34bcfb)
#define COLOR_ORANGE UIColorFromRGB(0xff7834)
#define COLOR_TAGS_BLUE UIColorFromRGB(0x3e8dd6)
#define COLOR_SECOND_GRAY UIColorFromRGB(0x666666)
#define COLOR_THIRD_GRAY UIColorFromRGB(0x999999)
#define COLOR_LOGIN_GREEN UIColorFromRGB(0x47c86d)
#define COLOR_COUPON_USED UIColorFromRGB(0xcccccc)
#define COLOR_LINE_GRAY UIColorFromRGB(0xE8E8E8)

@interface UICOLOR : NSObject

@end
