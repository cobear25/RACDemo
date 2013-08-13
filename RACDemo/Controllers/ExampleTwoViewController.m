//
//  ExampleTwoViewController.m
//  RACDemo
//
//  Created by Cody Mace on 8/13/13.
//  Copyright (c) 2013 Cody Mace. All rights reserved.
//

#import "ExampleTwoViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ExampleTwoViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation ExampleTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    RACSignal *redSignal = [[self.redSlider rac_signalForControlEvents:UIControlEventValueChanged] startWith:nil];
    RACSignal *greenSignal = [[self.greenSlider rac_signalForControlEvents:UIControlEventValueChanged] startWith:nil];
    RACSignal *blueSignal = [[self.blueSlider rac_signalForControlEvents:UIControlEventValueChanged] startWith:nil];

    RACSignal *combined = [RACSignal combineLatest:@[redSignal, greenSignal, blueSignal]
                                            reduce:^(UISlider *redSlider, UISlider *greenSlider, UISlider *blueSlider) {
                                                return [UIColor colorWithRed:redSlider.value green:greenSlider.value blue:blueSlider.value alpha:1];
                                            }];

    [combined toProperty:@"backgroundColor" onObject:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
