//
//  tabViewController.m
//  tableviewwithsectionforatg
//
//  Created by PIPL-01 on 29/06/17.
//  Copyright © 2017 Hitesh_iOScom.employee. All rights reserved.
//

#import "tabViewController.h"
#import "TableViewCell.h"
#import "ViewSection.h"

@interface tabViewController()

@end

@implementation tabViewController{
    
    NSMutableArray *arramain;
    NSMutableArray *arrsecond;
    
    NSMutableDictionary *dict;
    NSInteger *india;
    int count,cellCount;
  
    
    NSMutableArray *aray;
    NSMutableArray *ArrTemp;
    
    
    
}

- (void)viewDidLoad
{
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }

   ArrTemp= [[NSMutableArray alloc]init];

    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    count = 0;
    cellCount=0;

   
    
    arramain=[[NSMutableArray alloc]init];
    
   
    self.btnAdd1.layer.cornerRadius=3;
    self.btnAdd1.layer.borderWidth=1;
    self.btnAdd1.layer.borderColor=[UIColor blueColor].CGColor;
    
    self.btnRemove1.layer.cornerRadius=3;
    self.btnRemove1.layer.borderWidth=1;
    self.btnRemove1.layer.borderColor=[UIColor blueColor].CGColor;
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return  arramain.count;
    
    
    
    
}


-(NSIndexPath *) getButtonIndexPath:(UIButton *) button
{
    CGRect buttonFrame = [button convertRect:button.bounds toView:_tab];
    
    
    return [_tab indexPathForRowAtPoint:buttonFrame.origin];
}

    

-(void)btnFollowClicked:(UIButton*)sender
{
    UIButton *button = (UIButton *)sender;
    //    UIButton *senderButton = (UIButton *)sender;
    //    NSLog(@"current Row=%ld",(long)senderButton.tag);
    //    indexPath1 = [NSIndexPath indexPathForRow:0 inSection:senderButton.tag ];
    
  NSIndexPath  *indexPath1 = [self getButtonIndexPath:sender];

    cellCount++;
    NSString *id1 = [[arramain objectAtIndex:indexPath1.section ] valueForKey:@"id"];
  
    
    NSString *strCell= [NSString stringWithFormat:@"%d",cellCount];
    
    
    NSMutableDictionary *dcit =[[NSMutableDictionary alloc]init];
    
    if([[[arramain objectAtIndex:indexPath1.section] valueForKey:@"AddCell"] count]==1 )
    {
    
    [dcit setObject:strCell forKey:@"cellcount" ];
        [dcit setObject:@"false" forKey:@"flag" ];
        [dcit setObject:@"remove" forKey:@"btn" ];

    
    [[[arramain objectAtIndex:indexPath1.section] valueForKey:@"AddCell"] addObject:dcit];
    }
    else{
        
        if([[[[[arramain objectAtIndex:indexPath1.section] valueForKey:@"AddCell"] objectAtIndex:indexPath1.row]valueForKey:@"flag"] isEqualToString:@"true"] )
        {
            [dcit setObject:strCell forKey:@"cellcount" ];
            [dcit setObject:@"false" forKey:@"flag" ];
             [dcit setObject:@"remove" forKey:@"btn" ];

            [[[arramain objectAtIndex:indexPath1.section] valueForKey:@"AddCell"] addObject:dcit];

        }
        else
        {
             [[[arramain objectAtIndex:indexPath1.section] valueForKey:@"AddCell"]  removeObjectAtIndex:indexPath1.row];
              [dcit setObject:@"remove" forKey:@"btn" ];
        }
       

    }
    
    

    
    
   
    
//[dict replaceObjectAtIndex:india withObject:arrsecond];
        
    

    
    [_tab reloadData];
    

    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *ArrCell=[[arramain objectAtIndex:section]valueForKey:@"AddCell"];
   // NSArray *ArrCell = [arramain objectAtIndex: valueForKey:@"AddCell"];
    
    return ArrCell.count;
    
    
    }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"cell";
    TableViewCell *cell;
    if (!cell) {
        
        cell=(TableViewCell *)[self.tab dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    NSArray *nib;
    
    
    nib=[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil];
    cell=[nib objectAtIndex:0];

    if ([[[[[arramain objectAtIndex:indexPath.section] valueForKey:@"AddCell"] objectAtIndex:indexPath.row]valueForKey:@"btn"] isEqualToString:@"add"] )
    {
        cell.imgAdd.image=[UIImage imageNamed:@"plus.png"];
    }
    else if ([[[[[arramain objectAtIndex:indexPath.section] valueForKey:@"AddCell"] objectAtIndex:indexPath.row]valueForKey:@"btn"] isEqualToString:@"remove"] )
    {
         cell.imgAdd.image=[UIImage imageNamed:@"clear-button.png"];
    }
    
    [cell.btncell addTarget:self action:@selector(btnFollowClicked:) forControlEvents:UIControlEventTouchUpInside];
   

    cell.btncell.tag=indexPath.row;
    
    return cell;
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45; // you can have your own choice, of course
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:204/255 green:204/255 blue:204/255 alpha:0.20f];
   UITextField *txtweight = [[UITextField alloc] initWithFrame:CGRectMake (10, 10,130 , 30)];
    headerView.backgroundColor=[UIColor yellowColor];
    txtweight.font = [UIFont fontWithName:@"Arial" size:16];
     txtweight.placeholder = @" txt1";
    //   txtforemail.text=aValue1;
    txtweight.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtweight.borderStyle= UITextBorderStyleLine;
    txtweight.keyboardType = UIKeyboardTypeNumberPad;
    txtweight.clipsToBounds=NO;
    txtweight.delegate = self;
    txtweight.layer.borderColor=[[UIColor colorWithRed:97/255.0f green:144/255.0f blue:161/255.0f alpha:1.0f]CGColor];
    txtweight.layer.borderWidth=1.f;
    txtweight.layer.cornerRadius=8;
    txtweight.backgroundColor=[UIColor whiteColor];
    txtweight.clipsToBounds=YES;
   
    
    
    
    [headerView addSubview:txtweight];

    UITextField *txtweight1 = [[UITextField alloc] initWithFrame:CGRectMake (160, 10,130 , 30)];
    
    txtweight1.font = [UIFont fontWithName:@"Arial" size:16];
    txtweight1.placeholder = @" txt2";
    //   txtforemail.text=aValue1;
    txtweight1.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtweight1.borderStyle= UITextBorderStyleLine;
    txtweight1.keyboardType = UIKeyboardTypeNumberPad;
    txtweight1.clipsToBounds=NO;
    txtweight1.delegate = self;
    txtweight1.layer.borderColor=[[UIColor colorWithRed:97/255.0f green:144/255.0f blue:161/255.0f alpha:1.0f]CGColor];
    txtweight1.layer.borderWidth=1.f;
    txtweight1.layer.cornerRadius=8;
    txtweight1.clipsToBounds=YES;
    txtweight1.backgroundColor=[UIColor whiteColor];
    [headerView addSubview:txtweight1];

    
    
    return headerView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonadd:(id)sender {
    
    
    
    
   dict =[[NSMutableDictionary alloc]init];

  //  [dict setObject:[NSString stringWithFormat:@"%d",count] atIndexedSubscript:@"id"];
    
    [dict setObject:[NSString stringWithFormat:@"%d",count] forKey:@"id"];
    
    
    
   
    
    [arramain addObject:dict];
    
    
    NSMutableDictionary *dcit =[[NSMutableDictionary alloc]init];
    
    NSMutableArray *ArrTemp1 = [[NSMutableArray alloc]init];
    
    
    
    [dcit setObject:@"0" forKey:@"cellcount" ];
    [dcit setObject:@"true" forKey:@"flag" ];
    
    [ArrTemp1 addObject:dcit];
    
    NSMutableArray *arrDemo = [[NSMutableArray alloc]init];
    arrDemo=arramain.mutableCopy;
    NSMutableDictionary *dicttemp=[[NSMutableDictionary alloc]init];
    dicttemp=[arrDemo objectAtIndex:count];
    [dicttemp setObject:ArrTemp1 forKey:@"AddCell"];
    [arrDemo replaceObjectAtIndex:count withObject:dicttemp];
    arramain=arrDemo.mutableCopy;
    

    count++;
    
    [_tab reloadData];
    
    
    
}
- (IBAction)btnRemove:(id)sender
{
    count--;
    NSMutableArray *array;
    array=[arramain mutableCopy];
    [array removeLastObject];
    arramain=[array mutableCopy];
    
      [_tab reloadData];
  
}
@end
