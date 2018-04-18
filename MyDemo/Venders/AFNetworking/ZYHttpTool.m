//
//  ZYHtttpTool.m
//  TLXY
//
//  Created by yang on 14-8-14.
//  Copyright (c) 2014年 XZY. All rights reserved.
//

#import "ZYHttpTool.h"
#import "AFNetworking.h"

@interface ZYHttpTool ()
{
    UIView *bgView;
    UIButton *NonetBtn;
}
@end

@implementation ZYHttpTool
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
 
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    mgr.responseSerializer = response;
//    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
//    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
//    [mgr setResponseSerializer: responseSerializer];
    // 2.发送一个GET请求
//    [mgr GET:url parameters:params success:^(AFHTTPSessionManager *operation, id responseObject) { // 请求成功后会调用
//        if (success) {
//            success(responseObject);
//            if ([responseObject[@"code"] integerValue] == 400) {
//                if ([url containsString:@"tanchuangApi"]) {
//                    return ;
//                }
//                if ([responseObject[@"datas"][@"error"] isEqualToString:@"请登录"]) {
//                    if ([[CtrHelps getMessageWithKey:@"token"] length] > 0) {
//                        [MBProgressHUD showMessage:@"您的账号已在其他设备登录,请重新登录"];
//                    } else {
//                        //                        [MBProgressHUD showError:@"未登录,将前往登录界面"];
//                    }
//
//                    [[self new] performSelector:@selector(loginInVC) withObject:nil afterDelay:1.0];
//                    return ;
//                };
//            }
//        }
//    } failure:^(AFHTTPSessionManager *operation, NSError *error) { // 请求失败后会调用
//        if (failure) {
////            [MBProgressHUD showError:@"请求失败"];
//            return ;
////            failure(error);
//        }
//    }];
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    success(responseObject);
 
                }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
        //            [MBProgressHUD showError:@"请求失败"];
                    return ;
        //            failure(error);
                }
    }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
//    BOOL isExistenceNetwork = YES;
//    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    switch ([reach currentReachabilityStatus]) {
//        case NotReachable:
//            isExistenceNetwork = NO;
//            //NSLog(@"notReachable");
//            break;
//        case ReachableViaWiFi:
//            isExistenceNetwork = YES;
//            //NSLog(@"WIFI");
//            break;
//        case ReachableViaWWAN:
//            isExistenceNetwork = YES;
//            //NSLog(@"3G");
//            break;
//    }
//    
//    if (!isExistenceNetwork) {
//        [MBProgressHUD showError:@"没有网络"];
//        return ;
//    }
    // 1.获得请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *response = [AFJSONResponseSerializer serializer];
    response.removesKeysWithNullValues = YES;
    mgr.responseSerializer = response;
 
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                // 告诉外界(外面):我们请求成功了
                if (success) {
                    success(responseObject);
 
                }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failure) {
        //            failure(error);
        //            [MBProgressHUD showError:@"请求失败"];
                    return;
                }
    }];
    
}
//-(BOOL) isConnectionAvailable{
//    
//    BOOL isExistenceNetwork = YES;
//    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
//    switch ([reach currentReachabilityStatus]) {
//        case NotReachable:
//            isExistenceNetwork = NO;
//            //NSLog(@"notReachable");
//            break;
//        case ReachableViaWiFi:
//            isExistenceNetwork = YES;
//            //NSLog(@"WIFI");
//            break;
//        case ReachableViaWWAN:
//            isExistenceNetwork = YES;
//            //NSLog(@"3G");
//            break;
//    }
//    
//    if (!isExistenceNetwork) {
////        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
////        hud.removeFromSuperViewOnHide =YES;
////        hud.mode = MBProgressHUDModeText;
////        hud.labelText = @"没有网络";
////        hud.minSize = CGSizeMake(132.f, 40.0f);
////        [hud hide:YES afterDelay:3];
//        [MBProgressHUD showMessage:@"没有网络"];
//        return NO;
//    }
//    
//    return isExistenceNetwork;
//}
 
@end
