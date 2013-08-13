//
//  ExampleOneViewController.m
//  RACDemo
//
//  Created by Cody Mace on 8/13/13.
//  Copyright (c) 2013 Cody Mace. All rights reserved.
//

#import "ExampleOneViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ExampleOneViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ExampleOneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.textField.rac_textSignal subscribe:RACBind(self.label.text)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
