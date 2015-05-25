//
//  InfoViewController.h
//  TipCalculator
//
//  Created by Joe Sturzenegger on 5/6/15.
//  Copyright (c) 2015 Joe Sturzenegger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property(strong, nonatomic) NSArray *array;
@property (strong, nonatomic) IBOutlet UITextField *taxPercentTextField;


@end
