//
//  MoyafService.h
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoyafApi.h"
#import "MoyafResult.h"
#import "MoyafServiceRequester.h"

//#import <ReactiveObjc.h>


#pragma mark - MoyafServiceProtocol

@protocol MoyafServiceProtocol
@required
- (nullable MoyafRequestCanceller)requestWithApi:(nonnull id<MoyafApiProtocol>)api
                                      completion:(void (^ _Nullable) (MoyafResult * _Nonnull result))completion
                                         failure:(void (^ _Nullable)(NSError * _Nonnull error))failure;
@optional
- (nonnull instancetype)initWithBaseUrl:(nonnull NSString *)baseUrl;
- (nonnull instancetype)initWithRequester:(nonnull id<MoyafServiceRequesterProtocol>)requester;
@end


#pragma mark - MoyafService

@interface MoyafService : NSObject <MoyafServiceProtocol>
@property (strong, nonatomic, nonnull, readonly) id<MoyafServiceRequesterProtocol> requester;

- (nonnull instancetype)initWithBaseUrl:(nonnull NSString *)baseUrl NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithRequester:(nonnull id<MoyafServiceRequesterProtocol>)requester NS_DESIGNATED_INITIALIZER;

- (nullable MoyafRequestCanceller)requestWithApi:(nonnull id<MoyafApiProtocol>)api
                                      completion:(void (^ _Nullable) (MoyafResult * _Nonnull result))completion
                                         failure:(void (^ _Nullable)(NSError * _Nonnull error))failure;

@end

