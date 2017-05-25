//
//  HTTPManager.m
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "HTTPManager.h"
#import "Public.h"

//超时时间
#define TIMEOUTINTERVAL 20

@implementation HTTPManager

+(HTTPManager *)shareHTTPManager{
    
    static HTTPManager *httpManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        httpManager = [[HTTPManager alloc]init];
        httpManager.responseSerializer = [AFHTTPResponseSerializer serializer];
        httpManager.requestSerializer.timeoutInterval = TIMEOUTINTERVAL;
    });
    return httpManager;
}

-(NSString *)joinURL:(NSString *)URLStr{
    
    return [NSString stringWithFormat:@"%@%@",HTTPREQUESTHEADURL,URLStr];
}

#pragma mark 创建post请求
- (void)createPostWithPath:(NSString *)Path parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure{

    //NSLog(@"%@",[self joinURL:action]);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (parameter) {
        [params addEntriesFromDictionary:parameter];
    }
    NSString *postUrl = [self joinURL:Path];
    
    [self POST:postUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (success) {
            success(resultDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

#pragma mark 创建get请求
- (void)createGetWithPath:(NSString *)Path parameters:(NSDictionary *)parameter success:(HTTPRequestSuccess)success failure:(HTTPRequestFail)failure{

    //NSLog(@"%@",[self joinURL:action]);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (parameter) {
        [params addEntriesFromDictionary:parameter];
    }
    NSString *getUrl = [self joinURL:Path];

    [self GET:getUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if (success) {
            success(resultDic);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
