//
//  Public.m
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "Public.h"

@implementation Public

#pragma mark - #普通警告框
+(void)showAlertViewTitle:(NSString *)title toView:(UIView *)view{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:title delegate:view cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [view addSubview:alertView];
    [alertView show];
}

#pragma mark - #阴影提示框
+(void)showMessage:(NSString *)message withTime:(NSTimeInterval )time{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
    label.frame = CGRectMake(20, 15, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width - 20)/2, SCREEN_HEIGHT/2, LabelSize.width+40, LabelSize.height+30);
    
    [UIView animateWithDuration:time animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

#pragma mark - #获取头像的路径
+(NSString *)getUserHeadImagePath{
    NSString *path = [self getrealHomePath];
    
    NSString *headPath = [path stringByAppendingString:@"/userHead.png"];
    return headPath;
}

#pragma mark - #获取普通照片路径
+(NSString *)getUserPhotoImagePath:(NSString *)photoName{
    NSString *path = [self getrealHomePath];
    NSString *str = [NSString stringWithFormat:@"/%@,png",photoName];
    NSString *imagePath = [path stringByAppendingString:str];
    
    return imagePath;
}

#pragma mark - #根据图片写自己的头像入沙盒
+(void)writeHeadImgTodocument:(UIImage *)editedImage
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL existed = [fileManager fileExistsAtPath:[self getrealHomePath] isDirectory:nil];
    
    NSLog(@"%@",[Public getrealHomePath]);
    if (!(existed == YES))
    {
        [fileManager createDirectoryAtPath:[self getrealHomePath] withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSData *data=UIImageJPEGRepresentation(editedImage,0.3);
    if( [data writeToFile:[Public getUserHeadImgPath] atomically:YES])
    {
        NSLog(@"写入成功");
    }
}

#pragma mark - #根据key 获取user default的值
+(void)saveUserDefaultWithValue:(id)value forKey:(NSString *)key{
    
    if (!value) {
        return;
    }
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    [us setObject:value forKey:key];
    [us synchronize];
}

#pragma mark - #存键值队进userdefault
+(id)getUserDefaultWithKey:(NSString *)key{
    NSUserDefaults *us = [NSUserDefaults standardUserDefaults];
    
    if ([[NSString stringWithFormat:@"%@",[us objectForKey:key]] isEqualToString:@"(null)"]) {
        return @"";
    }
    return [us objectForKey:key];
}

/**
 *  拓展
 */
//自定义一个路径
+(NSString *)getrealHomePath{
    NSString *firstPath = [NSString stringWithFormat:@"%@/%@",[Public getUserDefaultWithKey:@"YOUNAME"],[self getUserDefaultWithKey:@"YOUKEY"]];
    
    NSString *path = [Public getDocumentWithOwnerPath:firstPath];
    return path;
}

+(NSString *)getDocumentWithOwnerPath:(NSString *)path{
    NSString *documentsDirectory = [NSHomeDirectory()stringByAppendingString:@"Documents"];
    NSString *returnPath = [documentsDirectory stringByAppendingPathComponent:path];
    
    return returnPath;
}

+(NSString *)getUserHeadImgPath
{
    NSString *path = [self getrealHomePath];
    NSString *headPath=[path stringByAppendingString:@"/userHead.png"];
    return headPath;
}

@end
