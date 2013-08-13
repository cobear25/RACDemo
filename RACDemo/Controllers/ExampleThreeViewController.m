//
//  ExampleThreeViewController.m
//  RACDemo
//
//  Created by Cody Mace on 8/13/13.
//  Copyright (c) 2013 Cody Mace. All rights reserved.
//

#import "ExampleThreeViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ExampleThreeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ExampleThreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[RACSignal
      combineLatest:@[self.usernameField.rac_textSignal, self.passwordField.rac_textSignal, self.confirmPasswordField.rac_textSignal]
      reduce:^(NSString *username, NSString *password, NSString *confirmPassword){
          return @(username.length >= 3 && [username rangeOfString:@"_"].location == NSNotFound && password.length >= 6 && [confirmPassword isEqualToString:password]);
      }] toProperty:@"enabled" onObject:self.loginButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
