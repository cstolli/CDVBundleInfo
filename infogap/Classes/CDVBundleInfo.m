//
//  CDVBundleInfo.m
//  
// Created by Chris Stoll on 05/12/2012. 
// Copyright 2011 Chris Stoll. All rights reserved.

#import "CDVBundleInfo.h" 

@implementation NSData (DataUtils)

static char base64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

- (NSString *)newStringInBase64FromData
{
    NSMutableString *dest = [[NSMutableString alloc] initWithString:@""];
    unsigned char * working = (unsigned char *)[self bytes];
    int srcLen = [self length];
    
    // tackle the source in 3's as conveniently 4 Base64 nibbles fit into 3 bytes
    for (int i=0; i<srcLen; i += 3)
    {
        // for each output nibble
        for (int nib=0; nib<4; nib++)
        {
            // nibble:nib from char:byt
            int byt = (nib == 0)?0:nib-1;
            int ix = (nib+1)*2;
            
            if (i+byt >= srcLen) break;
            
            // extract the top bits of the nibble, if valid
            unsigned char curr = ((working[i+byt] << (8-ix)) & 0x3F);
            
            // extract the bottom bits of the nibble, if valid
            if (i+nib < srcLen) curr |= ((working[i+nib] >> ix) & 0x3F);
            
            [dest appendFormat:@"%c", base64[curr]];
        }
    }
    
    return dest;
}

@end


@implementation NSString (StringUtils)

- (NSString *)newStringInBase64FromString
{
    NSData *theData = [NSData dataWithBytes:[self UTF8String] length:[self length]]; 
    
    return [theData newStringInBase64FromData];
}

@end

@implementation CDVBundleInfo 

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
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *bundleDisplayName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];      
    NSString *bundleIconPath = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIconFile"];
    UIImage* iconImage = [UIImage imageNamed:bundleIconPath];
    NSData *iconURI = UIImagePNGRepresentation(iconImage);
    NSMutableString *bundleIconURI = [iconURI newStringInBase64FromData];
   
    stringToReturn = [NSString stringWithFormat: @"{\"version\":\"%@\", \"build\":\"%@\", \"bundleId\":\"%@\", \"bundleDisplayName\":\"%@\", \"bundleIconUri\":\"%@\"}", appVersion, buildNumber, bundleId, bundleDisplayName, bundleIconURI];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                      messageAsString: stringToReturn];
    // Checking if the string received is empty or not
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

