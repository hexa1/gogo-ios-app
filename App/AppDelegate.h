//
//  AppDelegate.h
//  App
//
//  Created by David Rose on 10/30/14.
//  Copyright (c) 2014 Org. All rights reserved.
//

/*
 
 http://www.hollance.com/2012/02/dont-abuse-the-app-delegate/
 
 The app delegate performs an important function in your app but is not intended to be some magic singleton that holds all your data.
 
 It is the place where you receive notifications that concern the application as a whole: the app is launched, the app is about to go into the background, the app has returned from the background, and so on. You should restrict the role of the app delegate to just handling those notifications.
 
 The app delegate is where your app initializes itself — it creates the window and loads the initial view controller, it creates the data model objects or Core Data store — and then it passes control to that initial view controller. Beyond that, the app delegate should just handle the application-wide notifications and do nothing else.
 
 */

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
