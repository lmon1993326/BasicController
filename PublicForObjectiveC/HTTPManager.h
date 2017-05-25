//
//  HTTPManager.h
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

//定义block 成功与失败的block
typedef void(^HTTPRequestSuccess)(NSDictionary *dic);
typedef void(^HTTPRequestFail)(NSError *error);

@interface HTTPManager : AFHTTPSessionManager

//创建post请求
- (void)createPostWithPath:(NSString *)Path parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure;

//创建get请求
- (void)createGetWithPath:(NSString *)Path parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure;

//单例
+ (HTTPManager *)shareHTTPManager;

@end
