//
//  RNWikitudeViewManager.m
//  RNWikitude
//
//  Created by Peter Andringa on 3/22/19.
//  Copyright © 2019 UNC Emerging Technologies Lab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

#import <React/RCTViewManager.h>

@interface RNWikitudeViewManager : RCTViewManager
@end

@implementation RNWikitudeViewManager

RCT_EXPORT_MODULE(RNWikitudeView)

- (UIView *)view
{
    return [[MKMapView alloc] init];
}

@end
