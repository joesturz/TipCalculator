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
BOOL pickerIsNotHidden = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    self.array = [[NSArray alloc] initWithObjects:@"5%",@"10%",@"15%",@"20%",@"25%",@"30%",nil];    // Do any additional setup after loading the view.
    NSUserDefaults* data = [NSUserDefaults standardUserDefaults];
    [self.picker selectRow:[data integerForKey:@"percentValue"] inComponent:0 animated:false];
    self.taxPercentTextField.text = [NSString stringWithFormat:@"%.2f", [data doubleForKey:@"taxPercentage"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"%ld",currentRowPicker);
    [data setInteger:currentRowPicker forKey:@"percentValue"];
    
}

-(IBAction)returnFromSegue:(id)sender
{
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

@end
