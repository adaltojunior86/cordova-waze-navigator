//
//  waze-navigator.m
//  waze-navigator
//
//  Created by Adalto Junior on 7/21/15.
//
//

#import "waze-navigator.h"
#import <Cordova/CDV.h>

@implementation WazeNavigator

- (void)execute:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* latitude = [command.arguments objectAtIndex:0];
    NSString* longitude = [command.arguments objectAtIndex:1];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"waze://"]]) {

        NSString *urlStr = [NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes", latitude, longitude];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        
    } else {
        
        // Waze is not installed. Launch AppStore to install Waze app
        [[UIApplication sharedApplication] openURL:[NSURL                                                  URLWithString:@"http://itunes.apple.com/us/app/id323229106"]];

    }
    
}


@end