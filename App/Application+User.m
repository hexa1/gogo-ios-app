//
//  Application+User.m
//
//  Created by ____ on _____.
//  Copyright (c) 2014 ______. All rights reserved.
//


@implementation Application (User)

- (int) runCount
{
    int r = 0;
    NSInteger * rc = [[APP userPreferences] integerForKey:PREF_RUN_COUNT];
    if (rc != nil) {
        r = rc;
    }
    return r;
}

@end
