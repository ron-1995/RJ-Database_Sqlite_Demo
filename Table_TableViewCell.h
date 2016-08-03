//
//  Table_TableViewCell.h
//  Database_ISUD_demo
//
//  Created by ronakj on 4/29/16.
//  Copyright © 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Table_TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgview_in_table;
@property (strong, nonatomic) IBOutlet UILabel *lbl_username;
@property (strong, nonatomic) IBOutlet UILabel *lbl_email;

@end
