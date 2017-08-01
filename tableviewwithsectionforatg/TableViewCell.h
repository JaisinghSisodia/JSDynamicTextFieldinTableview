//
//  TableViewCell.h
//  tableviewwithsectionforatg
//
//  Created by PIPL-01 on 29/06/17.
//  Copyright © 2017 Hitesh_iOScom.employee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *txtcell1;
@property (strong, nonatomic) IBOutlet UITextField *txtcell2;
@property (strong, nonatomic) IBOutlet UIButton *btncell;

@property (weak, nonatomic) IBOutlet UIImageView *imgAdd;
@end
