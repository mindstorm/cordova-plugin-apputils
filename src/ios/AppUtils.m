//
//  AppUtils.m
//
//  The MIT License
//
//  Copyright (c) 2014 Paul Cervenka
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this
//  software and associated documentation files (the "Software"), to deal in the Software
//  without restriction, including without limitation the rights to use, copy, modify, merge,
//  publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to
//  whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or
//  substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "AppUtils.h"

@implementation AppUtils

- (void)IdleTimer:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSMutableDictionary *options = [command.arguments objectAtIndex:0];
    UIApplication* app = [UIApplication sharedApplication];
    NSString *action = [options objectForKey:@"action"];
    
    if ([action isEqualToString: @"enable"]) {
        if( [app isIdleTimerDisabled] ) {
            [app setIdleTimerDisabled:false];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        } else {
            // Error 1 - IdleTimer already enabled
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageToErrorObject:1];
        }
    } else if ([action isEqualToString: @"disable"]) {
        if( ![app isIdleTimerDisabled] ) {
            [app setIdleTimerDisabled:true];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        } else {
            // Error 1 - IdleTimer already disabled
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageToErrorObject:1];
        }
    } else if ([action isEqualToString: @"status"]) {
        if( [app isIdleTimerDisabled] ) {
            // disabled
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:0];
        } else {
            // enabled
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsInt:1];
        }
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)BundleInfo:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *info =    [NSDictionary dictionaryWithObjectsAndKeys:
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], @"bundleVersion",
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"], @"bundleBuild",
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"], @"bundleId",
                            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"], @"bundleDisplayName",
                            [[NSLocale preferredLanguages] objectAtIndex:0], @"localeLanguage",
                            nil];
        
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:info.JSONString];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end