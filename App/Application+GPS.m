//
//  Application+GPS.m
//
//  Created by _____ on _____.
//  Copyright (c) 2013 _____. All rights reserved.
//

@implementation Application (GPS)

/*
http://www.icodeblog.com/2012/06/04/how-to-add-gps-to-your-ios-app-part-1/
*/

- (void) startGPS
{
    if ([CLLocationManager locationServicesEnabled]) {
        LOG(@"Starting GPS...");
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        // Highest possible accuracy, drains battery quicker...
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        // Report all location change events
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        [self.locationManager startUpdatingLocation];
    } else {
        // TODO: Pop Error
        LOG(@"ERROR: Location services not enabled, not starting GPS...");
        [APP updateFeedbackNoGPS];
    }
}

- (void) stopGPS
{
    if (self.locationManager != nil) {
        [self.locationManager stopUpdatingLocation];
    }
    self.locationManager = nil;
}

- (bool) gpsIsStarted
{
    return self.locationManager != nil;
}

/* ios 5.0 */
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //LOG(@"ios 5.0-6.0 location update");
	//if([self conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self locationUpdate:newLocation];
	//}
}

/* iOS 6.0+ */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //LOG(@"ios 6.0+ location update");
    //if([self conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self locationUpdate:[locations lastObject]];
	//}
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	if ([self conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {
		[self locationError:error];
	}
}

- (void)locationUpdate:(CLLocation *)location
{
    //LOG(@"locationUpdate: %@", [location description]);
}

// TODO: do something meaningful...
- (void)locationError:(NSError *)error
{
	LOG(@"locationError: %@", error);
}
 
@end