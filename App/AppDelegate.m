//
//  DSAppDelegate.m
//  DriveSmartly
//
//  Created by David Rose on 3/5/13.
//  Copyright (c) 2013 David Rose. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *) launchOptions
{
    LOG(@"...");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = OFF_WHITE;
    
    APP.window = self.window;
	[APP initApp];
    LOG(@"Finished initializing app...");
    
    // App background gradient
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.window.rootViewController.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:[(id)[UIColor whiteColor] CGColor], (id)[HEX_COLOR(0xf4f4f4) CGColor], nil];
    
    //[self.view addSubview:self.scoreView];
    [self.window.rootViewController.view.layer insertSublayer:gradient atIndex:0];
    
    [self.window makeKeyAndVisible];
    LOG(@"Made window key and visible...");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *) application
{
    LOG(@"...");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *) application
{
    LOG(@"... Going in the background... ");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *) application
{
    LOG(@"... Going in the foreground... ");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *) application
{
    LOG(@"...");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *) application
{
    LOG(@"...");
    // Saves changes in the application's managed object context before the application terminates.
    [APP stopApp];
}

@end