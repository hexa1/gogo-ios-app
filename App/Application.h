//
//  DSApplication.h
//  DriveSmartly
//
//  Created by ____ on ____.
//  Copyright (c) 2013 _____. All rights reserved.
//

/*
 
 A singleton class holding common application methods
 http://www.johnwordsworth.com/2010/04/iphone-code-snippet-the-singleton-pattern/
 
 */

// TODO: Remove Me
#import <CoreLocation/CoreLocation.h>
#import "UserFeedback.h"

@interface Application : NSObject{
    NSManagedObjectModel * _managedObjectModel;
	NSManagedObjectContext * _managedObjectContext;
	NSPersistentStoreCoordinator * _persistentStoreCoordinator;
    //CMMotionManager *motionManager;
}

+ (id) sharedInstance;
- (void) initApp;
- (void) stopApp;
- (void) quit;

@property (nonatomic, strong) UIWindow * window;
@property (nonatomic, strong) UIViewController * mainViewController;

// Core data properties
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Core Location
@property (nonatomic, strong) CLLocationManager * locationManager;
//@property (nonatomic, strong) id coreLocationDelegate;

// User Defaults
@property (nonatomic, strong) NSUserDefaults * userPreferences;

@end

/// GUI

@interface Application (GUI)
- (void) initGUI;
- (void) showAlertType: (AlertType) alertType withViewController: (UIViewController *) viewController userInfo: (id) userInfo;
@end

/// CoreData

@interface Application (CoreData)
- (void) saveContext;
- (NSURL *)applicationDocumentsDirectory;
@end

/// GPS

@protocol CoreLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *) location;
- (void)locationError:(NSError *) error;
@end

@interface Application (GPS) <CLLocationManagerDelegate>
- (void) startGPS;
- (void) stopGPS;
- (bool) gpsIsStarted;
@end

@interface Application (Feedback)
- (UserFeedback*) feedbackBasedOnAlertType: (AlertType) type;
- (void) updateFeedbackNoGPS;
@end

@interface Application (User)
- (int) runCount;
@end

@interface Application (Twitter)
- (bool) canSendTweets;
- (void) tweet:(NSString*) msg;
@end
