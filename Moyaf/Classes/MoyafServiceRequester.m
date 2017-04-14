//
//  MoyafServiceRequester.m
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 4..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import "MoyafServiceRequester.h"


#pragma mark - MoyafServiceRequest()r

@interface MoyafServiceRequester()
@property (strong, nonatomic, nonnull) AFHTTPSessionManager *manager;
@end


#pragma mark - MoyafServiceRequester

@implementation MoyafServiceRequester

- (nonnull instancetype)init {
    return [self initWithBaseUrl:@""];
}

- (nonnull instancetype)initWithBaseUrl:(nonnull NSString *)baseUrl {
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
    }
    return self;
}

- (nullable MoyafRequestCanceller)requestWithApi:(nonnull id<MoyafApiProtocol>)api
                                      completion:(void (^ _Nullable) (MoyafResult * _Nonnull result))completion
                                         failure:(void (^ _Nullable)(NSError * _Nonnull error))failure {
    
    MoyafApiMethodType method = api.method;
    switch (method) {
        case MoyafApiMethodGet: {
            NSURLSessionDataTask * task = [self.manager GET:api.path
                                                 parameters:api.parameters
                                                   progress:nil
                                                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                        MoyafResult *result = [MoyafResult resultWithValue:responseObject api:api];
                                                        if (completion)
                                                            completion(result);
                                                    }
                                                    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                        if (failure)
                                                            failure(error);
                                                    }];
            return ^{ [task cancel]; };
        } break ;
            
        case MoyafApiMethodPost: {
            NSURLSessionDataTask * task = [self.manager POST:api.path
                                                  parameters:api.parameters
                                                    progress:nil
                                                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                         MoyafResult *result = [MoyafResult resultWithValue:responseObject api:api];
                                                         if (completion)
                                                             completion(result);
                                                     }
                                                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                         if (failure)
                                                             failure(error);
                                                     }];
            return ^{ [task cancel]; };
        } break ;
    }
}

@end

