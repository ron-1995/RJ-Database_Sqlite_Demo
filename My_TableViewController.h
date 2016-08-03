//
//  My_TableViewController.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//
#import <sqlite3.h>
#import <UIKit/UIKit.h>
#import "Table_TableViewCell.h"

@interface My_TableViewController : UITableViewController
{
    sqlite3 *db;
    
}

@property (strong, nonatomic) IBOutlet UITableView *my_tableview;
@property(strong,nonatomic)NSString *imgStr;

@property (strong , nonatomic) NSMutableArray * name;
@end
