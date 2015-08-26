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

- (void)openByUrl:(NSString *)url
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)navigateByWaze:(CDVInvokedUrlCommand *)command
{
    NSArray *latlng = command.arguments;
    NSString *lat = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:0]];
    NSString *lng = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:1]];
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"waze://"]]) {
        [self openByUrl:[NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes", [lat doubleValue], [lng doubleValue]]];
    }
    else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]])
    {
        [self openByUrl:[NSString stringWithFormat:@"comgooglemaps://?saddr=%f&daddr=%f", [lat doubleValue], [lng doubleValue]]];
    }
    else
    {
        [self openByUrl:@"http://itunes.apple.com/us/app/id323229106"];
    }
    
}


@end