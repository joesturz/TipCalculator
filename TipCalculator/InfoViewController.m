//
//  InfoViewController.m
//  TipCalculator
//
//  Created by Joe Sturzenegger on 5/6/15.
//  Copyright (c) 2015 Joe Sturzenegger. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

NSInteger currentRowPicker = 0;
BOOL _pickerIsNotHidden = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    self.array = [[NSArray alloc] initWithObjects:@"5% - 😕",@"10% - 😐",@"15% - 😊",@"20% - 😀",@"25% - 😃",@"30% - 😎",nil];    // Do any additional setup after loading the view.
    NSUserDefaults* data = [NSUserDefaults standardUserDefaults];
    [self.picker selectRow:[data integerForKey:@"percentValue"] inComponent:0 animated:false];
    self.taxPercentTextField.text = [NSString stringWithFormat:@"%.2f", [data doubleForKey:@"taxPercentage"]];
    //[self.picker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [self.array objectAtIndex:row];
    float greyColor = 125.0f;
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:greyColor/255.0 green:greyColor/255.0 blue:greyColor/255.0 alpha:1.0]}];
    
    return attString;
    
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}
-(IBAction)clickedBackground
{
    [self.view endEditing:YES];
}
-(IBAction)calculateClicked:(id)sender
{
    NSUserDefaults* data = [NSUserDefaults standardUserDefaults];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    float tax =[[formatter numberFromString:self.taxPercentTextField.text] floatValue];
    if (tax > 100.0f || tax < 0.0f)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Tax Percent Error"
                                                                       message:@"The tax rate must be between 0 and 100."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        if (tax < 0.0f)
        {
            [self.taxPercentTextField setText:@"0"];
        }
        if (tax > 100.0f)
        {
            [self.taxPercentTextField setText:@"100"];
        }
    }
    else
    {
        [data setDouble:tax forKey:@"taxPercentage"];
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
    NSUserDefaults* data = [NSUserDefaults standardUserDefaults];
    currentRowPicker = row;
    //NSLog(@"%ld",(long)currentRowPicker);
    [data setInteger:currentRowPicker forKey:@"percentValue"];
    
}

-(IBAction)returnFromSegue:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
