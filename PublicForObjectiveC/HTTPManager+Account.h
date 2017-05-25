//
//  HTTPManager+Account.h
//  PublicForObjectiveC
//
//  Created by LxMeten on 17/5/15.
//  Copyright © 2017年 LiXiang. All rights reserved.
//

#import "HTTPManager.h"

/**
 *  举例说明
 */

#define HTTPRequestLogin       @"user/api/coachLoginApi"   //用户登录
#define HTTPRequestRegister        @"user/api/registerCoach"   //用户注册(电话)

@interface HTTPManager (Account)

//用户登录
-(void)createUserLoginRequestFrom:(NSString *)userTel passsword:(NSString *)password successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure;

//注册详情
-(void)createUserRegisterInformationRequestFromrealtel:(NSString *)tel gender:(NSString *)gender drivingLicenseType:(NSString *)drivingLicenseType teachSubjects:(NSString *)teachSubjects identity:(NSString *)identity experienceYears:(NSString *)experienceYears realName:(NSString *)realName city:(NSString *)city identityPhoto:(NSString *)identityPhoto driversLicense:(NSString *)driversLicense proCoachCard:(NSString *)proCoachCard  carPhoto:(NSString *)carPhoto successFinsh:(HTTPRequestSuccess)success requestFail:(HTTPRequestFail)failure;


@end
