//
//  Submit_ViewController.m
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import "Submit_ViewController.h"
#import "Database_class.h"
#import "AppDelegate.h"

@interface Submit_ViewController ()<UIImagePickerControllerDelegate>
{
    Database_class *dbh;
    
  //  NSMutableArray *image_array;
    
    
    
}

@end

@implementation Submit_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
   // image_array = [[NSMutableArray alloc]init];

    
    appDel=((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    dbh=[[Database_class alloc]init];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:singleFingerTap];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Image"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Camera"
                                                    otherButtonTitles:@"Photo Gallary", nil];
    
    
    
    [actionSheet showInView:self.view];
    
}

//

//



-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        //            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        //            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //            picker.allowsEditing = YES;
        //            picker.delegate = self;
        //            [self presentModalViewController:picker animated:YES];
        [self takeNewPhotoFromCamera];
    }
    
    else if (buttonIndex==1)
    {
        //            UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
        //            pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //            pickerLibrary.delegate = self;
        //            [self presentModalViewController:pickerLibrary animated:YES];
        [self choosePhotoFromExistingImages];
    }
}
- (void)takeNewPhotoFromCamera
{
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentModalViewController:picker animated:YES];
    }
    else {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Camero j  Nahi" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        
        
    }
}

-(void)choosePhotoFromExistingImages
{
    
    UIImagePickerController *pickerLibrary = [[UIImagePickerController alloc] init];
    pickerLibrary.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerLibrary.delegate = self;
    [self presentModalViewController:pickerLibrary animated:YES];
    
    
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    UIImage *myImage = image;
    
    _myimgview.image=myImage;
    
    
    
    
    
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    localNotification.alertBody = @"Your alert message";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAction_Submit:(id)sender {
    
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    
    //        UIImage* image = [[UIImage alloc] init];                         CGImageRef cgref = [image CGImage];
    //        CIImage *cim = [image CIImage];
    //
    
    if(self.myimgview.image==nil)
    {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Please Upload Your Photo." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        
        
        
    }
     else if([self.txt_username.text isEqualToString:@""]){
        
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@" Please Enter Username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        NSLog(@"%@",self.txt_username.text);
    }
    else if([[self.txt_email.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)
    {
        
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"White Space is Not Allowed in Email Address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        NSLog(@"%@",self.txt_email.text);
    }
    
    else if ([emailTest evaluateWithObject:_txt_email.text] == NO)
    {
        
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@"Please Enter Valid Email Address." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        NSLog(@"%@",self.txt_email.text);
    }
    
    else if([self.txt_password.text isEqualToString:@""]){
       
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@" Please Enter Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        
        [alert show];
        NSLog(@"%@",self.txt_password.text);
    }
    
    else if (self.txt_password.text.length < 8)
    {
    
        UIAlertView *err4 = [[UIAlertView alloc]
                             initWithTitle:@"Invalid!" message:@"Enter a password longer than 8 chars." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [err4 show];
        NSLog(@"%@",self.txt_password.text);
    }
    
    
    //
    //           else if (cim == nil && cgref == NULL)
    //           {
    //                 UIAlertView *alert= [[UIAlertView alloc]initWithTitle:@"Invalid" message:@" Please Upload Photo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
    //                               [alert show];
    //            }
    
    else{
    
        // [image_array addObject:self.myimgview.image];
         [appDel.image_array addObject:self.myimgview.image];
        
        NSMutableDictionary *dic=[[NSMutableDictionary alloc ]init];
        
        
        [dic setObject:_txt_username.text forKey:@"username"];
        [dic setObject:_txt_email.text forKey:@"email"];
         [dic setObject:_txt_password.text forKey:@"password"];
        
       [dic setObject:_myimgview.image forKey:@"image"];
        
       
        
        
       NSMutableArray  *Array=[[NSMutableArray alloc]init];
        
        [Array addObject:dic];
        
        [dbh insertUser:Array];
        
        _txt_username.text = nil;
         _txt_email.text = nil;
         _txt_password.text = nil;
         _myimgview.image= nil;
    }
}


        




@end
