//
//  Navigationn_ViewController.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//
#import <sqlite3.h>
#import <UIKit/UIKit.h>

@interface Navigationn_ViewController : UIViewController
{
    sqlite3 *db1;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageview_updated;
@property (strong, nonatomic) IBOutlet UITextField *txt_uname;
@property (strong, nonatomic) IBOutlet UITextField *txt_updated_email;
@property (strong, nonatomic) IBOutlet UITextField *txt_updated_password;
@property(strong,nonatomic)NSString *unameStr;
@property(strong,nonatomic)NSString *emailStr;
@property(strong,nonatomic)NSString *passstr;
@property(strong,nonatomic)NSString *imgstr;
- (IBAction)backbtnaction:(id)sender;


- (IBAction)btn_update_action:(id)sender;

@end
