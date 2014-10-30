//
//  DSApplication.m
//
//  Created by ____ on ____.
//  Copyright (c) 2014 ____. All rights reserved.
//

/*
 
 Singleton Application Object
 https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaObjects/CocoaObjects.html
 This app uses ARC, so we don't need to implement release, retain, etc...

*/

#import "Application.h"

@implementation Application

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

@synthesize locationManager;

static Application *sharedInstance = nil;

//
// Get the shared instance and create it if necessary.
// 
+ (Application *)sharedInstance {
    if (nil != sharedInstance) {
        return sharedInstance;
    }
    
    //
    //http://www.johnwordsworth.com/2010/04/iphone-code-snippet-the-singleton-pattern/
    // Create a thread-safe instantiation of the sharedInstance
    // Thread safety only applies to instantiation, not to instance method calls
    
    static dispatch_once_t pred;        // Lock
    dispatch_once(&pred, ^{             // This code is called at most once per app
        sharedInstance = [[Application alloc] init];
    });

    return sharedInstance;
}

//
// Init Method Called when Singleton first initialized
//
- (id)init
{
    LOG(@"init");
    self = [super init];
    if (self) {
    }
    return self;
}

- (void) initApp
{
    LOG(@"initApp");
    self.userPreferences = [NSUserDefaults standardUserDefaults];
    NSInteger runCount = [self.userPreferences integerForKey:PREF_RUN_COUNT];
    runCount++;
    LOG(@"runCount=%i", runCount);
    [self.userPreferences setInteger:runCount forKey:PREF_RUN_COUNT];
    [self.userPreferences synchronize];
    //[self loadSampleData];
    LOG(@"Initializing GUI..");
    // Initiatize the GUI
    [self initGUI];
    [self startGPS];
}

- (void) stopApp
{
    LOG(@"Stopping app...");
}

- (void) quit
{
    [self stopApp];
    exit(0);
}

@end