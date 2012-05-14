//
//  CDVBundleInfo.h
//  CDVBundleInfo
//
//  Created by Chris Stoll on 5/12/12.
//  Copyright (c) 2012 WorldWide Digital Media. All rights reserved.
//

#import <Cordova/CDVPlugin.h>

@interface CDVBundleInfo : CDVPlugin {
    
    NSString* callbackID;  
}

@property (nonatomic, copy) NSString* callbackID;

// Instance Method  
- (void) getVersion:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end



