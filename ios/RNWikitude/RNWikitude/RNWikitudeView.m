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

@implementation UIView (mxcl)
- (UIViewController *)parentViewController {
    UIResponder *responder = self;
    while ([responder isKindOfClass:[UIView class]])
        responder = [responder nextResponder];
    return (UIViewController *)responder;
}
@end

@implementation RNWikitudeView

- (instancetype)init {
    if(self = [super init]){
        _packageUrl = nil;
        _sdkKey = nil;
    }
    return self;
}

- (void)setPackageUrl:(NSString *)packageUrl {
    NSLog(@"Wikitude Container package URL is: %@", packageUrl);
    _packageUrl = packageUrl;
    [self embed];
}

- (void)setSdkKey:(NSString *)sdkKey {
    NSLog(@"Wikitude Container SDK Key is: %@", sdkKey);
    _sdkKey = sdkKey;
    [self embed];
}

-(void) layoutSubviews {
    [super layoutSubviews];
    
    if(self.arViewController == nil){
        [self embed];
    }else{
        self.arViewController.view.frame = self.bounds;
    }
}

-(void) embed {
    UIViewController *parent = [self parentViewController];
    if(parent && _sdkKey && _packageUrl){
        NSLog(@"Setting up child view controllers");
        
        _arViewController = [[ARViewController alloc] init];
        [self.arViewController setUrl:_packageUrl];
        [self.arViewController setSdkkey:_sdkKey];

        
        [parent addChildViewController:self.arViewController];
        [self addSubview:self.arViewController.view];
        self.arViewController.view.frame = self.bounds;
        [self.arViewController didMoveToParentViewController:parent];
        self.arViewController = self.arViewController;
    }
}

@end
