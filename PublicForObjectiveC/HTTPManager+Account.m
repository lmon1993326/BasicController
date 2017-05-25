//
//  HTTPManager+Account.m
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "HTTPManager+Account.h"

@implementation HTTPManager (Account)


#pragma mark #用户登录
-(void)createUserLoginRequestFrom:(NSString *)userTel passsword:(NSString *)password successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if(userTel){
        [parameters setObject:userTel forKey:@"tel"];
    }
    if(password){
        [parameters setObject:password forKey:@"validCode"];
    }
    
    [self createPostWithPath:HTTPRequestLogin parameters:parameters success:success failure:failure];
}

#pragma mark #注册详情
-(void)createUserRegisterInformationRequestFromrealtel:(NSString *)tel gender:(NSString *)gender drivingLicenseType:(NSString *)drivingLicenseType teachSubjects:(NSString *)teachSubjects identity:(NSString *)identity experienceYears:(NSString *)experienceYears realName:(NSString *)realName city:(NSString *)city identityPhoto:(NSString *)identityPhoto driversLicense:(NSString *)driversLicense proCoachCard:(NSString *)proCoachCard  carPhoto:(NSString *)carPhoto successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (tel) {
        [parameters setObject:tel forKey:@"tel"];
    }
    
    if (gender) {
        [parameters setObject:gender forKey:@"gender"];
    }
    if (drivingLicenseType) {
        [parameters setObject:drivingLicenseType forKey:@"drivingLicenseType"];
    }
    if (teachSubjects) {
        [parameters setObject:teachSubjects forKey:@"teachSubjects"];
    }
    if (identity) {
        [parameters setObject:identity forKey:@"identity"];
    }
    if (experienceYears) {
        [parameters setObject:experienceYears forKey:@"experienceYears"];
    }
    if (realName) {
        [parameters setObject:realName forKey:@"realName"];
    }
    if (city) {
        [parameters setObject:city forKey:@"city"];
    }
    if (identityPhoto) {
        [parameters setObject:identityPhoto forKey:@"identityPhoto"];
    }
    if (driversLicense) {
        [parameters setObject:driversLicense forKey:@"driversLicense"];
    }
    if (proCoachCard) {
        [parameters setObject:proCoachCard forKey:@"proCoachCard"];
    }
    if (carPhoto) {
        [parameters setObject:carPhoto forKey:@"carPhoto"];
    }
    [self createPostWithPath:HTTPRequestRegister parameters:parameters success:success failure:failure];
}


@end
