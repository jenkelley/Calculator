//
//  ViewController.m
//  Multiply
//
//  Created by Jen Kelley on 3/9/15.
//  Copyright (c) 2015 Jen Kelley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property (strong, nonatomic) IBOutlet UILabel *answerValue;
@property (strong, nonatomic) IBOutlet UILabel *firstNumberEntered;
@property (strong, nonatomic) IBOutlet UILabel *secondNumberEntered;
@property (strong, nonatomic) IBOutlet UILabel *fizzBuzzLabel;
@property NSString *numberString;
@property (strong, nonatomic) IBOutlet UIButton *calculateButton;




@end

@implementation ViewController

/*
 Note to self. Figure out a way for the computer to recognize when one person is done 'typing' in the first label... maybe another button? In fact I'll do that now.
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fizzBuzzLabel.text = @"";

    self.numberString = @"";




}


//Calculate
- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    //this button also toggles between the two labels.

    self.numberString = @"";

    if ([sender.titleLabel.text isEqualToString:@"First Number Entered?"]) {
        [sender setTitle:@"Second Number Entered?" forState:UIControlStateNormal];
    } else if ([sender.titleLabel.text isEqualToString:@"Second Number Entered?"]) {
        [sender setTitle:@"Calculate!" forState:UIControlStateNormal];
    } else {
        [sender setTitle:@"First Number Entered?" forState:UIControlStateNormal];
        [self isThisFizzBuzz];
        //might need to change this to else if "calculate"
    }


}

-(void)isThisFizzBuzz{

    int answerInt = [self.answerValue.text intValue];

    if (answerInt %5 == 0) {
        self.fizzBuzzLabel.text = @"Buzz";
    } else if (answerInt %3 == 0) {
        self.fizzBuzzLabel.text = @"Fizz";
    } else if (answerInt %15 == 0) {
        self.fizzBuzzLabel.text = @"FizzBuzz";
    }
}

-(IBAction)onNumberButtonPressed:(UIButton *)sender{
    //get value of string and put it in the numberstring
    NSString *tempString = sender.titleLabel.text;
    //[self.numberString appendString:sender.titleLabel.text];

    if ([self.calculateButton.titleLabel.text isEqualToString:@"First Number Entered?"]) {
        self.numberString = [self.numberString stringByAppendingString:tempString];
        self.firstNumberEntered.text = self.numberString;

    } else if ([self.calculateButton.titleLabel.text isEqualToString:@"Second Number Entered?"]) {
        self.numberString = [self.numberString stringByAppendingString:tempString];
        self.secondNumberEntered.text = self.numberString;
    } else {
        //might need to change this to else if "calculate"
    }
}


@end
