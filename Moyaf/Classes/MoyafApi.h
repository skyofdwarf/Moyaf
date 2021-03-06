//
//  MoyafApi.h
//  Molla
//
//  Created by skyofdwarf on 2017. 3. 3..
//  Copyright © 2017년 dwarfini. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - MoyafApiMethodType

typedef NS_ENUM(NSInteger, MoyafApiMethodType) {
    MoyafApiMethodGet,
    MoyafApiMethodPost
};


#pragma mark - MoyafApiProtocol

@protocol MoyafApiProtocol
@required
- (MoyafApiMethodType)method;
- (nonnull NSString *)path;

@optional
- (nullable NSDictionary *)parameters;

- (nullable id)parseFromResponse:(nullable id)response;
- (nullable id)mock;
@end


#pragma mark - MoyafApi

@interface MoyafApi : NSObject <MoyafApiProtocol>
@property (assign, nonatomic, readonly) MoyafApiMethodType method;

@property (strong, nonatomic, nonnull, readonly) NSString *path;
@property (strong, nonatomic, nullable, readonly) NSDictionary *parameters;


- (nullable instancetype)init NS_UNAVAILABLE;

- (nonnull instancetype)initWithMethod:(MoyafApiMethodType)method
                                  path:(nonnull NSString *)path;

- (nonnull instancetype)initWithMethod:(MoyafApiMethodType)method
                                  path:(nonnull NSString *)path
                            parameters:(nullable NSDictionary *)parameters NS_DESIGNATED_INITIALIZER;

- (nullable id)parseFromResponse:(nullable id)response;
- (nullable id)mock;
@end



