//
//  DSUserFeedback.h
//
//  Created by _____ on _____.
//  Copyright (c) 2014 ______. All rights reserved.
//

@interface UserFeedback : NSObject

@property (nonatomic, strong) NSString * shortMessage;
@property (nonatomic, strong) NSString * longMessage;

- (id) initWithShortMessage: (NSString*)shortMsg andLongMessage: (NSString*) longMsg;

@end
