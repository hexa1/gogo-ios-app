//
//  Application+Twitter.m
//
//  Created by _____ on ______.
//  Copyright (c) 2014 ______. All rights reserved.
//

#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@implementation Application (Twitter)

- (bool) canSendTweets
{
    bool canSendTweets = [TWTweetComposeViewController canSendTweet];
    
    if (canSendTweets) {
        LOG(@"I can send Tweets");
    } else {
        LOG(@"I cannot send Tweets");
    }
    
    return canSendTweets;
}

- (void) tweet:(NSString *)msg
{
    if ([self canSendTweets] == NO) { return; }
    
    if ([self.userPreferences boolForKey:PREF_TWITTER_SHARE] == NO) {
        LOG(@"Twitter is connected, but sharing preference is turned off, not sending tweet...");
        return;
    }
    
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    // Request access from the user to access their Twitter account
    [account requestAccessToAccountsWithType:accountType withCompletionHandler:^(BOOL granted, NSError *error)
     {
         // Did user allow us access?
         if (granted == YES) {
             
             // Populate array with all available Twitter accounts
             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
             
             // Sanity check
             if ([arrayOfAccounts count] > 0) {
                 // Keep it simple, use the first account available
                 ACAccount *acct = [arrayOfAccounts objectAtIndex:0];
                 
                 NSString *status = [[NSString alloc] initWithString:msg];
                 
                 // Build a twitter request
                 TWRequest *postRequest = [[TWRequest alloc] initWithURL:
                                           [NSURL URLWithString:@"http://api.twitter.com/1/statuses/update.json"]
                                                              parameters:[NSDictionary dictionaryWithObject:status forKey:@"status"] requestMethod:TWRequestMethodPOST];
                  // Post the request
                 [postRequest setAccount:acct];
                 
                 // Block handler to manage the response
                 [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      LOG(@"Twitter response, HTTP response: %i", [urlResponse statusCode]);
                  }];
             }
         }
     }];
}

@end
