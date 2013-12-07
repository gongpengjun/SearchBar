//
//  AppDelegate.m
//  SearchBar
//
//  Created by 巩 鹏军 on 13-12-6.
//  Copyright (c) 2013年 巩 鹏军. All rights reserved.
//

#import "AppDelegate.h"

#import "SearchBarController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    SearchBarController *searchBarController = [[SearchBarController alloc] initWithNibName:nil bundle:nil];
    self.viewController = searchBarController;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
