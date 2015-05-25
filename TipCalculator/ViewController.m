//
//  ViewController.m
//  TipCalculator
//
//  Created by Joe Sturzenegger on 11/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import "ViewController.h"
#import "InfoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSInteger currentRow = 0;
BOOL pickerIsNotHidden;


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}

-(IBAction)clickedBackground
{
    [self.view endEditing:YES];
}

-(IBAction)calculateClicked:(id)sender
{
    //[self pickerView:self.picker didSelectRow:currentRow inComponent:0];
    [self updateLabels];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void) viewDidAppear:(BOOL)animated
{
    [self updateLabels];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)updateLabels
{
    NSUserDefaults *data = [NSUserDefaults standardUserDefaults];
    long row = [data integerForKey:@"percentValue"];
    double taxPercentage = [data doubleForKey:@"taxPercentage"];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    float checkAmount = [[formatter numberFromString:self.field.text] floatValue];
    float tipPercentage = (row+1)*.05f;
    float taxAmountDivisor = ((taxPercentage/100.0f)) + 1;
    float amountBeforeTax = checkAmount/taxAmountDivisor;
    float tipAmount = amountBeforeTax *tipPercentage;
    float total = checkAmount + tipAmount;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f", total];
    

}

-(IBAction)clickInfoButton:(id)sender
{
    [self performSegueWithIdentifier:@"InfoSegue" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"InfoSegue"]) {
        
        // Get destination view
        [segue destinationViewController];

    }
}


@end
