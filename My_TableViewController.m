//
//  My_TableViewController.m
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "My_TableViewController.h"
#import "AppDelegate.h"

#import "Database_class.h"
#import "Navigationn_ViewController.h"
#import "Table_TableViewCell.h"
#import "Submit_ViewController.h"

@interface My_TableViewController ()<UITableViewDataSource , UITableViewDelegate>
{
      Database_class *dbh2;
    
    AppDelegate *AppDel;
    
    NSMutableArray *img_arr,*username_arr,*email_arr,*pass_arr;
    
    NSString *simpleTableIdentifier;
    Table_TableViewCell *cell;
    
  Table_TableViewCell *tvc;
}

@end

@implementation My_TableViewController
@synthesize name,imgStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // [setImage:[UIImage imageNamed:imgStr]];
    
      AppDel= ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    [self selectData];
   
  
}
-(void)viewWillAppear:(BOOL)animated{
    
         [self.my_tableview reloadData];
    
    
    UITabBarItem *tbi = (UITabBarItem *)self.tabBarController.selectedViewController.tabBarItem;
    tbi.badgeValue = nil;
    [super viewWillAppear:YES];
}
-(NSString *)GetDatabasePath
        {
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *dirpath = [paths objectAtIndex:0];
            NSString *databasePath = [dirpath stringByAppendingPathComponent:@"/testDB.sqlite"];
            NSLog(@"Database path is %@",databasePath);
            return databasePath;
        }

- (void)selectData
{
    
   // img_arr= [[NSMutableArray alloc]init];
    username_arr = [[NSMutableArray alloc]init];
    email_arr = [[NSMutableArray alloc]init];
    pass_arr = [[NSMutableArray alloc]init];
    
    sqlite3_stmt    *statement;
    
    if (sqlite3_open([[self GetDatabasePath] UTF8String], & db) == SQLITE_OK)
    {
        NSString *getQuery = @"select * from Database_CRUD_Table";
        const char* qur_sqlchr=[getQuery UTF8String];
        
        if (sqlite3_prepare_v2(db,  qur_sqlchr/*[getQuery UTF8String]*/, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                int length = sqlite3_column_bytes(statement, 3);
                NSData *imageData = [NSData dataWithBytes:sqlite3_column_blob(statement, 0) length:length];
                
                NSLog(@"Length : %lu", (unsigned long)[imageData length]);
                
                if(imageData == nil)
                    NSLog(@"No image found.");
                else
                tvc.imgview_in_table.image = [UIImage imageWithData:imageData];
                
              
                [username_arr addObject:[[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(statement, 0)]];
                [email_arr addObject:[[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(statement, 1)]];
                [pass_arr addObject:[[NSString alloc]initWithUTF8String:(const char*)sqlite3_column_text(statement, 2)]];
                
            }
            
        }
       // [_my_tableview reloadData];
        
    }
}
        
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [username_arr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdsentifier = @"Cell123";
    
    
    
  cell = [_my_tableview dequeueReusableCellWithIdentifier:CellIdsentifier];
    
    if (cell == nil )
    {
        cell = [[Table_TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdsentifier];
        
        
        
    }
    
    
    
    cell.lbl_username.text=[NSString stringWithFormat:@"%@",[username_arr objectAtIndex:indexPath.row]];

    cell.lbl_email.text=[NSString stringWithFormat:@"%@",[email_arr objectAtIndex:indexPath.row]];
    
    //  cell.imgview_in_table.image = [AppDel.image_array objectAtIndex:indexPath.row];
    
   // cell.imgview_in_table.image = [img_arr objectAtIndex:indexPath.row];
    
    
    return cell;
    
    
    
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        int index = indexPath.row;
//        [username_arr removeObjectAtIndex:index];
//        [email_arr removeObjectAtIndex:index];
//        
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
//                         withRowAnimation:UITableViewRowAnimationFade];
//        
//        [_my_tableview reloadData];
//    }
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        sqlite3_stmt *stmt;
       if (sqlite3_open([[self GetDatabasePath] UTF8String], & db) == SQLITE_OK){
            
            NSString *deleteSQL =[NSString stringWithFormat:@"DELETE from Database_CRUD_Table where username=\"%@\"",[username_arr objectAtIndex:indexPath.row]];
            
            NSLog(@"Query : %@",deleteSQL);
            
            const char *delete_stmt=[deleteSQL UTF8String];
            
            sqlite3_prepare_v2(db, delete_stmt, -1, &stmt, NULL);
            
            if(sqlite3_step(stmt) == SQLITE_DONE)
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Record Deleted..!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
              
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete" message:@"Record Not Deleted..!!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alert show];
            
            }
        }
        
        [username_arr removeObjectAtIndex:indexPath.row];
      //  [AppDel.image_array removeObjectAtIndex:indexPath.row];
        
        
        [email_arr removeObjectAtIndex:indexPath.row];
        [_my_tableview reloadData];
        
    }
//    [self selectData];  // Here Call your main getdata function from where you are fetching your data from database
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    Navigationn_ViewController *myVC = (Navigationn_ViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"Navigationn_ViewController"];
    
    myVC.unameStr=[username_arr objectAtIndex:indexPath.row];
    myVC.emailStr=[email_arr objectAtIndex:indexPath.row];
     myVC.passstr=[pass_arr objectAtIndex:indexPath.row];
      myVC.imgstr=[AppDel.image_array objectAtIndex:indexPath.row];
      
    [[self navigationController]pushViewController:myVC animated:YES];
}

//- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (_my_tableview.editing)
//    {
//        return UITableViewCellEditingStyleDelete;
//    }
//    
//    return UITableViewCellEditingStyleNone;
//}
//
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
@end
