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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
