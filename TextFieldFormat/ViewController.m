//
//  ViewController.m
//  TextFieldFormat
//
//  Created by Alexey Baryshnikov on 08.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark ***UITextFieldDelegate

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
//- (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//- (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason API_AVAILABLE(ios(10.0)); // if implemented, called in place of textFieldDidEndEditing:

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"text: %@", textField.text);
    NSLog(@"in range: %@", NSStringFromRange(range));
    NSLog(@"with string: %@", string);
    
    NSString *resultingString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSLog(@"result: %@", resultingString);
    NSCharacterSet *filter = [NSCharacterSet characterSetWithCharactersInString:@" ,"];
    NSArray *words = [resultingString componentsSeparatedByCharactersInSet:filter];
    NSLog(@"%ld - %@", [words count] ,words);
    return [resultingString length] <= 10;
}

- (void)textFieldDidChangeSelection:(UITextField *)textField API_AVAILABLE(ios(13.0), tvos(13.0)) {
    NSLog(@"textFieldDidChangeSelection");
    
}

//- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
//- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.


@end
