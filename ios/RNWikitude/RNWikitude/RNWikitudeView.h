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
@interface UIView (mxcl)
- (UIViewController *)parentViewController;
@end

@interface RNWikitudeView : UIView
@property (nonatomic, retain) NSString *packageUrl;
@property (nonatomic, retain) NSString *sdkKey;
@property (nonatomic, strong) ARViewController *arViewController;
@end
