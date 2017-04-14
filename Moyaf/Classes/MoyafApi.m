//
//  MoyafApi.m
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import "MoyafApi.h"


#pragma mark - MoyafApi

@interface MoyafApi ()
@property (assign, nonatomic) MoyafApiMethodType method;

@property (strong, nonatomic, nonnull) NSString *path;
@property (strong, nonatomic, nullable) NSDictionary *parameters;
@end

@implementation MoyafApi

- (nullable instancetype)init NS_UNAVAILABLE {
    [NSException raise:@"MoyafExceptionNonAvailableInitializer" format:@"you need to use designated initializers"];
    return nil;
}
- (nonnull instancetype)initWithMethod:(MoyafApiMethodType)method
                                  path:(nonnull NSString *)path {
    return [self initWithMethod:method
                           path:path
                     parameters:nil];
}

- (nonnull instancetype)initWithMethod:(MoyafApiMethodType)method
                                  path:(nonnull NSString *)path
                            parameters:(nullable NSDictionary *)parameters {
    self = [super init];
    if (self) {
        self.method = method;
        self.path = path;
        self.parameters = parameters;
    }
    return self;
}

- (nullable id)parseFromResponse:(nullable id)response {
    return response;
}

- (nullable id)mock {
    return @{};
}

@end

