//
//  Application+Feedback.m
//
//  Created by _____ on ______.
//  Copyright (c) 2014 _______. All rights reserved.
//

#import "UserFeedback.h"

@implementation Application (Feedback)

- (UserFeedback*) feedbackBasedOnAlertType: (AlertType) type
{
    NSString *shortMsg = @"";
    NSString *longMsg = @"";
    
    if (type == AlertGPSDisabled) {
        shortMsg = @"No GPS";
        longMsg = @"GPS disabled";
    }
    
    if (type == AlertUnknownError) {
        shortMsg = @"Oops!";
        longMsg = @"Unknown Alert Error!";
    }
    
    UserFeedback * feedback = [[UserFeedback alloc] initWithShortMessage:shortMsg andLongMessage:longMsg];
    return feedback;
}

- (void) updateFeedbackNoGPS
{
    //UserFeedback * feedback = [APP feedbackBasedOnAlertType:AlertGPSDisabled];
    // do something here...
}

@end
