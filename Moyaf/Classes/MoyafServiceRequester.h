//
//  MoyafServiceRequester.h
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 4..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoyafApi.h"
#import "MoyafResult.h"
#import <AFNetworking/AFNetworking.h>

#pragma mark - MoyafRequestCanceller

typedef void (^MoyafRequestCanceller)();


#pragma mark - MoyafServiceRequesterProtocol

@protocol MoyafServiceRequesterProtocol

- (nullable MoyafRequestCanceller)requestWithApi:(nonnull id<MoyafApiProtocol>)api
									  completion:(void (^ _Nullable) (MoyafResult * _Nonnull result))completion
										 failure:(void (^ _Nullable)(NSError * _Nonnull error))failure;
@end


#pragma mark - MoyafServiceRequester

@interface MoyafServiceRequester: NSObject <MoyafServiceRequesterProtocol>
@property (strong, nonatomic, nonnull, readonly) AFHTTPSessionManager *manager;

- (nonnull instancetype)initWithBaseUrl:(nonnull NSString *)baseUrl;
@end
