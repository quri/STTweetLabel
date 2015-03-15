//
//  STAppDelegate.m
//  STTweetLabelExample
//
//  Created by Sebastien Thiebaud on 12/16/12.
//  Copyright (c) 2012 Sebastien Thiebaud. All rights reserved.
//

#import "STAppDelegate.h"
#import "STTwitterTableViewController.h"

@implementation STAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    STTwitterTableViewController *controller = [STTwitterTableViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
