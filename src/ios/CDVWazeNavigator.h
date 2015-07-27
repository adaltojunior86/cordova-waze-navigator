//
//  waze-navigator.h
//  waze-navigator
//
//  Created by Adalto Junior on 7/21/15.
//
//
#import <Cordova/CDV.h>

@interface CDVWazeNavigator : CDVPlugin

- (void)openByUrl:(NSString *)url;
- (void)navigateByWaze:(CDVInvokedUrlCommand*)command;

@end

