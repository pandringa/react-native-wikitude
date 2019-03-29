//
//  RNWikitudeView.h
//  RNWikitude
//
//  Created by Peter Andringa on 3/29/19.
//  Copyright © 2019 UNC Emerging Technologies Lab. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RNWikitude.h"

@interface RNWikitudeView : WTArchitectView
@property (nonatomic, assign) NSString *packageUrl;
@property (nonatomic, assign) NSString *sdkKey;
@end
