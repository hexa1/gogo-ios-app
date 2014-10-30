Overview
========

A bare-bones iOS Application demonstrating several simple structural setup principles:

- Separate groups for different app aspects
- Prefixing with Constants
- Constants divided according to their type: Macros, Constants, Types
- Many examples of useful macros: Fonts, Frames, App Singleton, Listeners/Observers, Log, iOS version checking, etc...
- `APP` macro to return Application Singleton, which is not the `AppDelegate`: AppDelegate is left alone as per principle
- App singleton is Categorized according to function and concern (CodeData, GUI, GPS, Twitter, etc...)
- Setting run counter in user preferences
- Twitter: checking Tweeting capability and sending a tweet
- GPS location update for iOS 5.0 and 6.0+
- Alert Feedback controller using `AlertType` struct type, App-wide alert popping
- Core Data implementation and interface moved into a separate App singleton category
- Keeping Views, Controllers, Models, Resources, and Constants separate

Best Practices
==============

- Instead of ```((DSAppDelegate *)[[UIApplication sharedApplication] delegate])``` use `APP` macro
- Instead of ```NSLog(...)``` use `LOG` macro

TODO
====

- Drop in Alert View