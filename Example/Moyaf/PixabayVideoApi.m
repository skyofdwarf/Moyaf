//
//  PixabayVideoApi.m
//  Moyaf
//
//  Created by skyofdwarf on 2017. 4. 14..
//  Copyright © 2017년 skyofdwarf. All rights reserved.
//

#import "PixabayVideoApi.h"


@implementation PixabayVideoApi

- (nonnull instancetype)init {
    return [self initWithCategory:@"" query:@""];
}

- (nonnull instancetype)initWithCategory:(NSString *_Nullable)category query:(NSString * _Nullable)query {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{ @"pretty": @"true" }];
    [params setValue:category forKey:@"category"];
    [params setValue:query forKey:@"q"];
    
    return [super initWithMethod:MoyafApiMethodGet
                            path:@"api/videos/"
                      parameters:params];
}

@end
