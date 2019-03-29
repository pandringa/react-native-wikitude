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

#import "RNWikitude.h"
#import "RNWikitudeView.h"
#import "RNWikitudeViewManager.h"

@implementation RNWikitudeViewManager

RCT_EXPORT_MODULE(RNWikitudeView)

RCT_EXPORT_VIEW_PROPERTY(sdkKey, NSString)
RCT_EXPORT_VIEW_PROPERTY(packageUrl, NSString)

- (UIView *)view
{
    RNWikitudeView *wikiView = [[RNWikitudeView alloc] init];
    wikiView.delegate = self;
    wikiView.requiredFeatures = WTFeature_ImageTracking;
    
    NSLog(@"Set Wikitude Key to: %@", wikiView.sdkKey);
    [wikiView setLicenseKey:wikiView.sdkKey];
    
    NSLog(@"Set Wikitude URL to: %@", wikiView.packageUrl);
    [wikiView loadArchitectWorldFromURL:[NSURL URLWithString:wikiView.packageUrl]];
    
    return wikiView;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

@end
