//
//  Database_class.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AppDelegate.h"

@interface Database_class : NSObject{
    
    NSString *dataPath;
    
    sqlite3 *db;
    
    NSString *query;
    
    NSString *query_select;
    
    AppDelegate *AppDel;
    
    NSMutableArray *name;
    
}

-(BOOL)insertUser:(NSArray *)dealArray;
//-(BOOL)selectUser:(NSArray *)dbSelectArray;
//+ (NSMutableArray *)readRecords;
//-(BOOL)FetchUser:(NSArray *)FetchArray;
//-(void)getdataMT;


@end
