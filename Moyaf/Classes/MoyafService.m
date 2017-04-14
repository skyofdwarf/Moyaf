//
//  MoyafService.m
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import "MoyafService.h"
#import "MoyafApi.h"


#pragma mark - MoyafService()

@interface MoyafService()
@property (strong, nonatomic, nonnull) id<MoyafServiceRequesterProtocol> requester;
@end


#pragma mark - MoyafService

@implementation MoyafService

- (nullable instancetype)init UNAVAILABLE_ATTRIBUTE {
    return nil;
}

- (nonnull instancetype)initWithBaseUrl:(nonnull NSString *)baseUrl {
    NSParameterAssert(baseUrl);
    self = [super init];
    if (self) {
        self.requester = [[MoyafServiceRequester alloc] initWithBaseUrl:baseUrl];
    }
    
    return self;
}

- (nonnull instancetype)initWithRequester:(nonnull id<MoyafServiceRequesterProtocol>)requester {
    self = [super init];
    if (self) {
        self.requester = requester;
    }
    
    return self;
}

- (nullable MoyafRequestCanceller)requestWithApi:(nonnull id<MoyafApiProtocol>)api
                                      completion:(void (^ _Nullable) (MoyafResult * _Nonnull result))completion
                                         failure:(void (^ _Nullable)(NSError * _Nonnull error))failure {
    return [self.requester requestWithApi:api completion:completion failure:failure];
}

@end

/*
#pragma mark - MoyafService(Rx)

@implementation MoyafService(Rx)
- (RACSignal<MoyafResult *> * _Nonnull)requestWithApi:(id<MoyafApiProtocol> _Nonnull)api {
    typeof(self) __weak wself = self;
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        MoyafRequestCanceller _Nullable canceller = [wself.requester requestWithApi:api completion:^(MoyafResult * _Nonnull result) {
            [subscriber sendNext:result];
            [subscriber sendCompleted];
        } failure:^(NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            if (canceller)
                canceller();
        }];
    }] replayLast];
    
}
@end
*/
