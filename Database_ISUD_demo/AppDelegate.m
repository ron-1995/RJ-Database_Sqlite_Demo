//
//  AppDelegate.m
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "AppDelegate.h"
#import "my_tab_bar_ViewController.h"
#import "My_TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize dbpath,dic,Array;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
     dic=[[NSMutableDictionary alloc ]init];
   _image_array=[[NSMutableArray alloc]init];
    // Array=[[NSMutableArray alloc]init];
   //  name=[[NSMutableArray alloc]init];
    [self check];
    
//    
//    my_tab_bar_ViewController  *firstVC = (my_tab_bar_ViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//                                                  instantiateViewControllerWithIdentifier:@"my_tab_bar_ViewController"];
//    
//UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:firstVC];
//    
//    [navController setNavigationBarHidden:YES animated:YES];
//    
//   self.window.rootViewController=navController;

    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)check
{
    NSArray *arrdir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[arrdir objectAtIndex:0];
    
    self.dbpath=[path stringByAppendingString:@"/testDB.sqlite"];
    if(![[NSFileManager defaultManager]fileExistsAtPath:self.dbpath])
    {
        NSError *err;
        NSString *searchpath=[[NSBundle mainBundle]pathForResource:@"testDB" ofType:@"sqlite"];
        
        NSLog(@"%@",searchpath);
        
        [[NSFileManager defaultManager]copyItemAtPath:searchpath toPath:self.dbpath error:&err];
    }
    
}
@end
