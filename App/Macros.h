//
//  Macros.h
//
//  Created by _____ on ______.
//  Copyright (c) 2014 ___. All rights reserved.
//
//  Put all your macros here

#import "AppDelegate.h"

#define APP_DELEGATE ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define APP ((Application *)[Application sharedInstance])

#ifdef DEBUG
#define LOG(format, ...) NSLog(@"%s: %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:format, ## __VA_ARGS__])
#else
#define LOG(format, ...)
#endif

#define LOC_STR(key) NSLocalizedString(key,@"")

#define LOG_DEALLOC(object) LOG(@"Deallocating %@ (0x%x)", [[object class] description], (unsigned int)object)
#define LOG_RELEASE_NIL(object) LOG(@"Releasing %@ (0x%x)", [[object class] description], (unsigned int)object); [object release]; object = nil;
#define RELEASE_NIL(object) [object release]; object = nil;
#define SET_LABEL_SIZE(label) { CGSize __size = [label.text sizeWithFont:label.font]; label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, __size.width, __size.height); }
#define SET_LABEL_HEIGHT(label) { CGSize __size = [label.text sizeWithFont:label.font]; label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, __size.height); }
#define SET_LABEL_WIDTH(label) { CGSize __size = [label.text sizeWithFont:label.font]; label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, __size.width, label.frame.size.height); }
#define SET_LABEL_SIZE_MULTILINE(label) { label.lineBreakMode = UILineBreakModeWordWrap; label.numberOfLines = 0; CGSize __size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, CGFLOAT_MAX) lineBreakMode:label.lineBreakMode]; label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, __size.width, __size.height); }
#define SET_LABEL_HEIGHT_MULTILINE(label) { label.lineBreakMode = UILineBreakModeWordWrap; label.numberOfLines = 0; CGSize __size = [label.text sizeWithFont:label.font constrainedToSize:CGSizeMake(label.frame.size.width, CGFLOAT_MAX) lineBreakMode:label.lineBreakMode]; label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, __size.height); }

#define RIGHT_X(view) (view.frame.origin.x + view.frame.size.width)
#define BOTTOM_Y(view) (view.frame.origin.y + view.frame.size.height)
#define SET_Y(view,y) view.frame = CGRectMake(view.frame.origin.x, y, view.frame.size.width, view.frame.size.height)
#define SET_X(view,x) view.frame = CGRectMake(x, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define SET_WIDTH(view,width) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, width, view.frame.size.height)
#define SET_HEIGHT(view,height) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height)
#define ADD_X(view,delta) view.frame = CGRectMake(view.frame.origin.x + delta, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define ADD_Y(view,delta) view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y + delta, view.frame.size.width, view.frame.size.height)

#define MY_WIDTH self.view.frame.size.width
#define MY_HEIGHT self.view.frame.size.height
#define MY_VIEW_FRAME CGRectMake(0, 0, MY_WIDTH, MY_HEIGHT)

#define MY_FRAME_WIDTH self.frame.size.width
#define MY_FRAME_HEIGHT self.frame.size.height
#define MY_FRAME CGRectMake(0, 0, MY_FRAME_WIDTH, MY_FRAME_HEIGHT)

#define LOG_FRAME(view) LOG(@"Frame: (%f, %f) (%f x %f)", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height)
#define HEX_COLOR(color) [UIColor colorWithRed:(((color >> 16) & 0xFF) / 255.0) green:(((color >> 8) & 0xFF) / 255.0) blue:((color & 0xFF) / 255.0) alpha:1.0]

#define FONT_HELVETICA(fontSize) [UIFont fontWithName: @"Helvetica" size: fontSize]
#define FONT_HELVETICA_BOLD(fontSize) [UIFont fontWithName: @"Helvetica-Bold" size: fontSize]
#define FONT_HELVETICA_NEUE(fontSize) [UIFont fontWithName: @"HelveticaNeue" size: fontSize]
#define FONT_HELVETICA_NEUE_BOLD(fontSize) [UIFont fontWithName: @"HelveticaNeue-Bold" size: fontSize]
#define FONT_HELVETICA_NEUE_LIGHT(fontSize) [UIFont fontWithName: @"HelveticaNeue-Light" size: fontSize]
#define FONT_HELVETICA_NEUE_ITALIC(fontSize) [UIFont fontWithName: @"HelveticaNeue-Italic" size: fontSize]

//http://iosfonts.com/
//#define APP_FONT(fontSize) [UIFont fontWithName: @"GillSans-Light" size: fontSize]
//#define APP_FONT_BOLD(fontSize) [UIFont fontWithName: @"GillSans-Bold" size: fontSize]

#define IS_IOS6_AND_UP ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0)

#define REGULAR_FONT (IS_IOS6_AND_UP?@"Avenir-Light":@"Helvetica-Light")
#define BOLD_FONT (IS_IOS6_AND_UP?@"Avenir-Medium":@"Helvetica")

#define APP_FONT(fontSize) [UIFont fontWithName: REGULAR_FONT size: fontSize]
#define APP_FONT_BOLD(fontSize) [UIFont fontWithName: BOLD_FONT size: fontSize]

#define IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define DEFAULTS [NSUserDefaults standardUserDefaults]
#define DEFAULTS_SAVE [DEFAULTS synchronize]
#define SET_DEFAULT_OBJ(key, obj) [DEFAULTS setObject: obj forKey: key]
#define SET_DEFAULT_FLOAT(key, val) [DEFAULTS setFloat: val forKey: key]
#define SET_DEFAULT_BOOL(key, val) [DEFAULTS setBool: val forKey: key]
#define SET_DEFAULT_INT(key, val) [DEFAULTS setInteger: val forKey: key]
#define REM_DEFAULT(key) [DEFAULTS removeObjectForKey: key]
#define GET_DEFAULT_OBJ(key) [DEFAULTS objectForKey: key]
#define GET_DEFAULT_BOOL(key) [DEFAULTS boolForKey: key]
#define GET_DEFAULT_INT(key) [DEFAULTS integerForKey: key]
#define GET_DEFAULT_FLOAT(key) [DEFAULTS floatForKey: key]

#define NOTIF_SEND(notifName, obj, extra)  [[NSNotificationCenter defaultCenter] postNotificationName:notifName object:obj userInfo: extra]
#define NOTIF_ADD_LISTENER(notifName, target, sel, obj) [[NSNotificationCenter defaultCenter] addObserver:target selector:sel name:notifName object: obj]
#define NOTIF_REMOVE_LISTENER(target) [[NSNotificationCenter defaultCenter] removeObserver: target];
#define NOTIF_REMOVE_LISTENER_BY_NAME(target, notifName, obj) [[NSNotificationCenter defaultCenter] removeObserver: target name: notifName object: obj];
