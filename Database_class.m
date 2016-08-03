//
//  Database_class.m
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "Database_class.h"
#import "AppDelegate.h"

@implementation Database_class


-(BOOL)insertUser:(NSArray *)dealArray
{
    AppDel= ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    NSLog(@"%@",dealArray);
    
    BOOL isok=NO;
    
    sqlite3_stmt    *statement5;
    
    if(sqlite3_open([AppDel.dbpath UTF8String],&db) == SQLITE_OK)
    {
        for (int i = 0; i<[dealArray count];i++)
        {
            
            query = [NSString stringWithFormat: @"INSERT INTO Database_CRUD_Table (username,email,password,image) VALUES ('%@','%@','%@','%@')",
                     [[dealArray objectAtIndex:i]objectForKey:@"username"],
                     
                     [[dealArray objectAtIndex:i]objectForKey:@"email"],
                     
                     [[dealArray objectAtIndex:i]objectForKey:@"password"],
                     
                     [[dealArray objectAtIndex:i]objectForKey:@"image"]];
            
            
            
            
            const char *insert_stmt = [query UTF8String];
            
            sqlite3_prepare_v2(db, insert_stmt, -1, &statement5, NULL);
            if (sqlite3_step(statement5) == SQLITE_DONE)
            {
                NSLog(@"Data name add---->");
                
            } else {
                
            }
            sqlite3_finalize(statement5);
        }
        sqlite3_close(db);
    }
    
    return isok;
    
    
}
@end

