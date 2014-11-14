//
//  ViewController.h
//  TipCalculator
//
//  Created by Joe Sturzenegger on 11/5/14.
//  Copyright (c) 2014 Joe Sturzenegger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *field;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property(strong, nonatomic) NSArray *array;

-(BOOL)textFieldShouldReturn:(UITextField *)textField;
-(IBAction)clickedBackground;

@end

