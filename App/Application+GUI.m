//
//  Application+GUI.m
//
//  Created by _____ on _____.
//  Copyright (c) 2014 ______. All rights reserved.
//

//#import "AlertView.h"

@implementation Application (GUI)

- (void) initGUI
{
    // Create the main GUI Here
    LOG(@"APP+GUI initGUI");
    
    LOG(@"Constructing main view controller...");
    self.mainViewController = [[UIViewController alloc] init];
    
    // Add PageMenuView on top of it
    LOG(@"Constructing Views...");
    
    // Now set the windows main controller to the page scroll controller
    [self.window setRootViewController:self.mainViewController];
    
    LOG(@"Done constructing views...");
}

// Pop an alert
- (void) showAlertType: (AlertType) alertType withViewController: (UIViewController *) viewController userInfo: (id) userInfo
{
    /*
	AlertView * alertView = [[AlertView alloc] init];
	alertView.type = alertType;
	alertView.viewController = viewController;
	alertView.userInfo = userInfo;
	alertView.delegate = self;
	
	switch (alertType) {
        case DSAlertGPSDisabled: {
            alertView.title = @"No GPS!";
            alertView.message = @"You'll need GPS to run this app.";
            [alertView addButtonWithTitle:@"OK"];
            break;
        }
        
        case DSAlertDeleteRoute: {
            alertView.title = @"Delete Route";
            alertView.message = @"Delete this route?";
            [alertView addButtonWithTitle:@"Yes"];
            [alertView addButtonWithTitle:@"No"];
            break;
        }
            
		default:
			break;
	}
    
	[alertView show];
    */
}

#pragma UIAlertViewDelegate;

// Delegate for app-wide alerts
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    /*
	if ([alertView isKindOfClass:[AlertView class]]) {
		AlertView * myAlertView = (AlertView *)alertView;
		switch (myAlertView.type) {
            case DSAlertDeleteRoute:
                if (buttonIndex == 0
                    && [myAlertView.userInfo isKindOfClass:[DSRoute class]]) {
                    DSRoute * route = (DSRoute*)myAlertView.userInfo;
                    LOG(@"I will delete route: %@", route);
                    [APP deleteRoute:route];
                }
                
                break;
            default:
				break;
		}
	}
    */
}

@end