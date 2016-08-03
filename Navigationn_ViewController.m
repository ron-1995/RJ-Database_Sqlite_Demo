//
//  Navigationn_ViewController.m
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "Navigationn_ViewController.h"
#import "AppDelegate.h"
#import "Database_class.h"

@interface Navigationn_ViewController (){
    
    Database_class *dbh3;
    
    AppDelegate *AppDel3;
}

@end

@implementation Navigationn_ViewController


@synthesize unameStr,emailStr,passstr,imgstr;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDel3= ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
     //   [_imageview_updated setImage:[UIImage imageNamed:imgstr]];
    
    _txt_uname.text=[NSString stringWithFormat:@"%@",unameStr];
    _txt_updated_email.text=[NSString stringWithFormat:@"%@",emailStr];
    _txt_updated_password.text=[NSString stringWithFormat:@"%@",passstr];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)GetDatabasePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dirpath = [paths objectAtIndex:0];
    NSString *databasePath = [dirpath stringByAppendingPathComponent:@"/testDB.sqlite"];
    NSLog(@"Database path is %@",databasePath);
    return databasePath;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backbtnaction:(id)sender {
    
    
     [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

- (IBAction)btn_update_action:(id)sender {
    
    
    sqlite3_stmt *stmt;
    
    if (sqlite3_open([[self GetDatabasePath] UTF8String], & db1) == SQLITE_OK){
        
        NSString *insertSQL = [NSString stringWithFormat:
                               @"UPDATE Database_CRUD_Table SET email = '%@' , password = '%@' WHERE username = '%@'" ,_txt_updated_email.text,_txt_updated_password.text,_txt_uname.text];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        
        sqlite3_prepare_v2(db1, insert_stmt, -1, &stmt, NULL);
        
        if (sqlite3_step(stmt) == SQLITE_DONE)
        {
            //self.settingStatus.text = @"Contact added";
            
            NSLog(@"contact added");
        } else {
            // self.settingStatus.text = @"Failed to add contact";
            NSLog(@"failed to add contact");
        }        // [_my_tableview reloadData];
        
    }
    
}
@end
