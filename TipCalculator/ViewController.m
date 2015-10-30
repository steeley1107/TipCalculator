//
//  ViewController.m
//  TipCalculator
//
//  Created by Steele on 2015-10-30.
//  Copyright © 2015 Steele. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;
@property (nonatomic) float tipPercentage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tipPercentage = 15;
    self.tipPercentageTextField.text = [NSString stringWithFormat:@"%0.0f",self.tipPercentage];
    
    [self.billAmountTextField becomeFirstResponder];
    
    self.tipPercentageTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTip:(id)sender {
    
    [self.billAmountTextField resignFirstResponder];
    [self.tipPercentageTextField resignFirstResponder];
    
    float tipPercentBy100 = [self.tipPercentageTextField.text floatValue]/100;
    float tipAmount = [self.billAmountTextField.text floatValue] * tipPercentBy100;
    
    self.tipAmountLabel.text = [NSString stringWithFormat:@"Please Tip $%0.2f",tipAmount];
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.text = [NSString stringWithFormat:@""];
}
@end
