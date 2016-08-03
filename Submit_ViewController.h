//
//  Submit_ViewController.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface Submit_ViewController : UIViewController
{
    AppDelegate *appDel;
}
@property (strong, nonatomic) IBOutlet UIImageView *myimgview;
@property (strong, nonatomic) IBOutlet UITextField *txt_username;
@property (strong, nonatomic) IBOutlet UITextField *txt_email;
@property (strong, nonatomic) IBOutlet UITextField *txt_password;
- (IBAction)btnAction_Submit:(id)sender;

@end
