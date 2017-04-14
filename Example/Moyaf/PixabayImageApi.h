//
//  PixabayImageApi.h
//  Moyaf
//
//  Created by skyofdwarf on 2017. 4. 14..
//  Copyright © 2017년 skyofdwarf. All rights reserved.
//

#import "PixabayApi.h"

@interface PixabayImageApi: PixabayApi

- (nonnull instancetype)initWithCategory:(NSString *_Nullable)category
                                   query:(NSString * _Nullable)query;

@end

