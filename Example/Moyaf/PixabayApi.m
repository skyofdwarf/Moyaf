//
//  PixabayApi.m
//  Moyaf
//
//  Created by skyofdwarf on 2017. 4. 14..
//  Copyright © 2017년 skyofdwarf. All rights reserved.
//

#import "PixabayApi.h"

@implementation PixabayApi

- (nonnull instancetype)initWithMethod:(MoyafApiMethodType)method path:(NSString *)path parameters:(NSDictionary *)parameters {
    NSMutableDictionary *fixedParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    fixedParams[@"key"] = @"4108223-fed2f236f043232ca177dd718";
    
    return [super initWithMethod:method path:path parameters:fixedParams];
}

@end

