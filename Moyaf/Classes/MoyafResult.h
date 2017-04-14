//
//  MoyafResult.h
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoyafApi.h"



#pragma mark - MoyafErrorDomain

extern NSString *const _Nonnull MoyafErrorDomain;

#pragma mark - MoyafErrorCodeType

typedef NS_ENUM(NSInteger, MoyafErrorCodeType) {
    MoyafErrorSuccess = 0,
    MoyafErrorUnknown = 1,
    MoyafErrorParseError = 2
};


#pragma mark - MoyafResult

@interface MoyafResult<Value>: NSObject
@property (strong, nonatomic, nullable, readonly) Value value;
@property (strong, nonatomic, nullable, readonly) id response;
@property (strong, nonatomic, nullable, readonly) NSError *error;

@property (assign, nonatomic, readonly) BOOL success;
+ (nonnull instancetype)resultWithValue:(nonnull Value)value;
+ (nonnull instancetype)resultWithError:(nonnull NSError *)error;
+ (nonnull instancetype)resultWithValue:(nonnull id)value api:(nonnull id<MoyafApiProtocol>)api;

- (nonnull instancetype)initWithValue:(nonnull Value)value NS_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithValue:(nonnull Value)value api:(nonnull id<MoyafApiProtocol>)api;
- (nonnull instancetype)initWithError:(nonnull NSError *)error NS_DESIGNATED_INITIALIZER;
@end


