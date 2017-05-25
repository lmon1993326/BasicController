//
//  Public.h
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  网络类
 */
//正式接口
#define ServerRootPath @"http://www.qijiala.com/"

//测试接口
#define testServerRootPath @"http://testwww.qijiala.com/"

//正在使用的接口
//#define HTTPREQUESTHEADURL testServerRootPath
#define HTTPREQUESTHEADURL  ServerRootPath

/**
 *  功能类
 */
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]  //当前的ios版本
#define Save(str) ([str length]==0||[str isEqualToString:@"(null)"])?@"":str  //判断字符串是否为空
#define KEYWINDOW [UIApplication sharedApplication].keyWindow
#define NETWORKERRORNOTICE(view) if (view !=nil ) [Public showErrorWithStatus:@"网络异常，请稍后重试" toView:view];

/**
 *   这儿一般写一些公共的名,比如通知的id,cellid,各种id
 */
#define LogoutNotification @"LogoutNotification" //注销通知
#define LoginNotification @"LoginNotification" //登陆通知


@interface Public : NSObject

//普通警告框
+(void)showAlertViewTitle:(NSString *)title toView:(UIView *)view;

//阴影警告框
+(void)showMessage:(NSString *)message withTime:(NSTimeInterval *)time;  //一般设置1.5sOK

//获取头像的路径
+(NSString *)getUserHeadImagePath;

//获取普通照片路径
+(NSString *)getUserPhotoImagePath:(NSString *)photoName;

//根据图片写自己的头像入沙盒
+(void)writeHeadImgTodocument:(UIImage *)editedImage;

//根据key 获取user default的值
+(id)getUserDefaultWithKey:(NSString *)key;

//存键值队进userdefault
+(void)saveUserDefaultWithValue:(id)value forKey:(NSString *)key;



@end
