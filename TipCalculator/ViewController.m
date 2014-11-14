//
//  ViewController.m
//  TipCalculator
//
//  Created by Joe Sturzenegger on 11/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSInteger currentRow = 0;
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
    [self pickerView:self.picker didSelectRow:currentRow inComponent:0];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Initialize Data
    
    // Connect data
    self.picker.dataSource = self;
    self.picker.delegate = self;
    self.array = [[NSArray alloc] initWithObjects:@"5%",@"10%",@"15%",@"20%",@"25%",@"30%",nil];
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 6;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.array objectAtIndex:row];
}
//this is called when the wheel is rotated and settles on a new row
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    currentRow = row;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    float checkAmount = [[formatter numberFromString:self.field.text] floatValue];
    float percentage = (row+1)*.05f;
    float tipAmount = checkAmount * percentage;
    float totalAmount= checkAmount + tipAmount;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"%.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"%.2f",totalAmount];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
