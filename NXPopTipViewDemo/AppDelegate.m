//
//  AppDelegate.m
//  NXPopTipViewDemo
//
//  Created by next on 2020/9/3.
//  Copyright © 2020 next. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:ViewController.new];
    navVC.view.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}
@end
