//
//  MoyafViewController.m
//  Moyaf
//
//  Created by skyofdwarf on 03/05/2017.
//  Copyright (c) 2017 skyofdwarf. All rights reserved.
//

#import "MoyafViewController.h"
#import "PixabayImageApi.h"
#import "PixabayVideoApi.h"
#import "PixabayService.h"

@interface MoyafViewController ()

@end

@implementation MoyafViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)test {
    PixabayImageApi *image = [[PixabayImageApi alloc] initWithCategory:@"people" query:nil];
    PixabayService *service = [PixabayService new];
    
    [service requestWithApi:image
                 completion:^(MoyafResult * _Nonnull result) {
                     NSLog(@"result: %@", result);
                 } failure:^(NSError * _Nonnull error) {
                     NSLog(@"error: %@", error);
                 }];
}
@end
