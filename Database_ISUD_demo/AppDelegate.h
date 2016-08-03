//
//  AppDelegate.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
NSString *dbPath;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong , nonatomic) NSMutableDictionary * dic;
@property (strong , nonatomic) NSMutableArray * Array;
@property (strong , nonatomic) NSMutableArray * image_array;

//@property (strong , nonatomic) NSMutableArray * name;
-(void)check;
@property (retain, nonatomic)NSString *dbpath;


@end

