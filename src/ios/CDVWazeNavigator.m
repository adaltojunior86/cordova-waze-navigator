//
//  waze-navigator.m
//  waze-navigator
//
//  Created by Adalto Junior on 7/21/15.
//
//

#import <Cordova/CDV.h>
#import "CDVWazeNavigator.h"

@implementation CDVWazeNavigator

- (void)navigateByWaze:(CDVInvokedUrlCommand *)command
{
    NSArray *latlng = command.arguments;
    NSString *lat = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:0]];
    NSString *lng = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:1]];

    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"waze://"]]) {

        NSString *urlStr = [NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes", [lat doubleValue], [lng doubleValue]];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
        
    } else {
        
        // Waze is not installed. Launch AppStore to install Waze app
        [[UIApplication sharedApplication] openURL:[NSURL                                                  URLWithString:@"http://itunes.apple.com/us/app/id323229106"]];

    }
    
}


@end