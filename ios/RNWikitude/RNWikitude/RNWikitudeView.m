//
//  RNWikitudeView.m
//  RNWikitude
//
//  Created by Peter Andringa on 3/29/19.
//  Copyright © 2019 UNC Emerging Technologies Lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WikitudeSDK/WikitudeSDK.h>
#import "RNWikitudeView.h"

@implementation RNWikitudeView

- (void)setPackageUrl:(NSString *)packageUrl {
//    NSLog(@"Wikitude Package URL is: %@", packageUrl);
    [self loadArchitectWorldFromURL:[NSURL URLWithString:packageUrl]];
    
    if(self.sdkKey && self.packageUrl){
        [self startRendering];
    }
}

- (void)setSdkKey:(NSString *)sdkKey {
//    NSLog(@"Wikitude SDK Key is: %@", sdkKey);
    [self setLicenseKey:sdkKey];
    
    if(self.sdkKey && self.packageUrl){
        [self startRendering];
    }
}

- (void)startRendering {
    if ( ![self isRunning] ) {
        [self start:^(WTStartupConfiguration *configuration) {
            // configuration.captureDevicePosition = AVCaptureDevicePositionFront;
        } completion:^(BOOL isRunning, NSError *error) {
            if ( !isRunning ) {
                NSLog(@"WTArchitectView could not be started. Reason: %@", [error localizedDescription]);
            } else {
                NSLog(@"Started Wikitude rendering");
            }
        }];
    }
}

- (void)stopRendering {
    if ( [self isRunning] ) {
        [self stop];
    }
}
@end
