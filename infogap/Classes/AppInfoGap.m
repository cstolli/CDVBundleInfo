//
//  AppInfoGap.m
//  
// Created by Chris Stoll on 05/12/2012 in approximately 30 minutes. 
// Copyright 2011 Chris Stoll. All rights reserved.

#import "AppInfoGap.h" 

@implementation AppInfoGap 

@synthesize callbackID;

-(void)getVersion:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options  
{
    // The first argument in the arguments parameter is the callbackID.
    // We use this to send data back to the successCallback or failureCallback
    // through PluginResult.   
    self.callbackID = [arguments pop];
    
    // Create the Message that we wish to send to the Javascript
    //NSMutableString *stringToReturn = [NSMutableString stringWithString: @""];
    NSString *stringToReturn = @"";
    NSString *buildNumber = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    // Append the received string to the string we plan to send out        
    
    //[stringToReturn appendString:buildNumber];
    //[stringToReturn appendString:@" "appVersion];
    stringToReturn = [NSString stringWithFormat: @"{\"revision\":\"%@\", \"build\":\"%@\"}", appVersion, buildNumber];
    // Create Plugin Result 
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                      messageAsString: stringToReturn];
    // Checking if the string received is HelloWorld or not
    if ([stringToReturn isEqualToString:@""])
    {
        // Call  the Success Javascript function
        [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
    } else
    {    
        // Call  the Failure Javascript function
        [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
    }
}
@end