//
//  TipViewController.m
//  TipCalculator
//
//  Created by Bharath Rajendran on 6/5/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\bharat10. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipController;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title=@"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (IBAction)onTap:(id)sender {
    
    //[self.view.endEditing=YES];
    NSLog(@"log on tap , End editing doesnt work .. :-( ");
    [self updateValues];
}

- (void)updateValues{
    
    float billAmountValue = [self.billAmount.text floatValue];
    NSArray *tipValues = @[@(0.1),@(0.15),@(0.2)];
    
    float tipAmount = billAmountValue * [tipValues[self.tipController.selectedSegmentIndex] floatValue];
    
    float totalAmount = tipAmount+billAmountValue;
    
    self.tipLabel.text=[NSString stringWithFormat:@"$%0.2f" , tipAmount];
    self.totalLabel.text=[NSString stringWithFormat:@"$%0.2f" , totalAmount];
    
}

@end