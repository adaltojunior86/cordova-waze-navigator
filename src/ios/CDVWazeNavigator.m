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

- (void)openByUrl:(NSString *)url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

- (void)navigateByWaze:(CDVInvokedUrlCommand *)command {
    [self showAlert:command.arguments];
}

- (void)showAlert:(NSArray*) latlng {

    NSString *fromLat = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:0]];
    NSString *fromLng = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:1]];
    NSString *toLat = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:2]];
    NSString *toLng = [NSString stringWithFormat:@"%@",[latlng objectAtIndex:3]];



    UIAlertController * alert;

    if ( [(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"] ) {
        alert = [UIAlertController
                                        alertControllerWithTitle:nil
                                        message:nil
                                        preferredStyle:UIAlertControllerStyleAlert];
    } else {
        alert = [UIAlertController
            alertControllerWithTitle:nil
            message:nil
            preferredStyle:UIAlertControllerStyleActionSheet];
    }

    UIAlertAction* waze = [UIAlertAction
                           actionWithTitle:@"Waze"
                           style:UIAlertActionStyleDefault
                           handler:^(UIAlertAction * action) {
                               if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"waze://"]]) {
                                   [self openByUrl:[NSString stringWithFormat:@"waze://?ll=%f,%f&navigate=yes", [toLat doubleValue], [toLng doubleValue]]];
                               } else {
                                   [self openByUrl:@"http://itunes.apple.com/us/app/id323229106"];
                               }
                           }];

   UIAlertAction* nav = [UIAlertAction
                          actionWithTitle:@"GM Nav"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action) {
                              if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"gmnav://"]]) {
                                  [self openByUrl:[NSString stringWithFormat:@"gmnav://?ll=%f,%f", [toLat doubleValue], [toLng doubleValue]]];
                              } else {
                                   [self openByUrl:@"http://itunes.apple.com/us/app/id1514784576"];
                              }
                          }];

    UIAlertAction* googleMaps = [UIAlertAction
                                 actionWithTitle:@"Google Maps"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"comgooglemaps://"]]) {
                                         [self openByUrl:[NSString stringWithFormat:@"comgooglemaps://?saddr=%f,%f&daddr=%f,%f",
                                                          [fromLat doubleValue], [fromLng doubleValue],[toLat doubleValue], [toLng doubleValue]]];
                                     } else {
                                         [self openByUrl:@"https://itunes.apple.com/us/app/google-maps-transit-food/id585027354?mt=8"];
                                     }
                                 }];

    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleCancel
                             handler:^(UIAlertAction * action) {
                                 [alert dismissViewControllerAnimated:true completion:nil];
                             }];
    [alert addAction:nav];
    [alert addAction:waze];
    [alert addAction:googleMaps];
    [alert addAction:cancel];


    [self.viewController presentViewController:alert animated:YES completion:nil];
}

@end
