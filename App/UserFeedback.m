//
//  UserFeedback.m
//
//  Created by _____ on ______.
//  Copyright (c) 2014 ______. All rights reserved.
//

#import "UserFeedback.h"

@implementation UserFeedback

- (id) initWithShortMessage:(NSString *)shortMsg andLongMessage:(NSString *)longMsg
{
    self = [super init];
    if (self) {
        if (shortMsg == nil) { shortMsg = @""; }
        if (longMsg == nil) { longMsg = @""; }
        
        self.shortMessage = shortMsg;
        self.longMessage = longMsg;
    }
    return self;
}

@end
