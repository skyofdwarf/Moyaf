//
//  MoyafResult.m
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import "MoyafResult.h"
#import "MoyafApi.h"


#pragma mark - MoyafErrorDomain

NSString *const _Nonnull MoyafErrorDomain = @"MoyafErrorDomain";


#pragma mark - MoyafResult()

@interface MoyafResult()
@property (strong, nonatomic, nullable) id value;
@property (strong, nonatomic, nullable) id response;
@property (strong, nonatomic, nullable) NSError *error;
@property (assign, nonatomic) BOOL success;
@end



#pragma mark - MoyafResult

@implementation MoyafResult

+ (nonnull instancetype)resultWithValue:(nonnull id)value {
    return [[MoyafResult alloc] initWithValue:value];
}

+ (nonnull instancetype)resultWithValue:(nonnull id)value api:(nonnull id<MoyafApiProtocol>)api {
    return [[MoyafResult alloc] initWithValue:value api:api];
}


+ (nonnull instancetype)resultWithError:(nonnull NSError *)error {
    return [[MoyafResult alloc] initWithError:error];
}

- (nullable instancetype)init NS_UNAVAILABLE {
    [NSException raise:@"MoyafExceptionNonAvailableInitializer" format:@"you need to use designated initializers"];
    return nil;
}

- (nonnull instancetype)initWithValue:(nonnull id)value {
    NSParameterAssert(value);
    if (value) {
        self = [super init];
        if (self) {
            self.response = value;
            self.value = value;
            self.success = YES;
        }
    }
    
    return self;
}

- (nonnull instancetype)initWithValue:(nonnull id)value api:(nonnull id<MoyafApiProtocol>)api {
    id model = [api parseFromResponse:value];
    if (model) {
        return [self initWithValue:model];
    }
    else {
        return [self initWithError:[NSError errorWithDomain:MoyafErrorDomain
                                                       code:MoyafErrorParseError
                                                   userInfo:nil]];
    }
}

- (nonnull instancetype)initWithError:(nonnull NSError *)error {
    self = [super init];
    if (self) {
        self.error = error;
        self.success = NO;
    }
    
    return self;
}

- (NSString *)description {
    if (self.success) {
        return [NSString stringWithFormat:@"success: %d\nresponse: %@", self.success, self.response];
    }
    else {
        return [NSString stringWithFormat:@"success: %d\nerror: %@", self.success, self.error];
    }
}
@end

