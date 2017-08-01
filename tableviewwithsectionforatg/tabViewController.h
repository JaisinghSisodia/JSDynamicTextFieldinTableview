//
//  tabViewController.h
//  tableviewwithsectionforatg
//
//  Created by PIPL-01 on 29/06/17.
//  Copyright © 2017 Hitesh_iOScom.employee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tabViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIButton *buttonadd;
- (IBAction)buttonadd:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *tab;


@property (weak, nonatomic) IBOutlet UIButton *btnAdd1;

@property (weak, nonatomic) IBOutlet UIButton *btnRemove1;



@property (strong, nonatomic) IBOutlet UIView *viewSection;
- (IBAction)btnRemove:(id)sender;

@end
