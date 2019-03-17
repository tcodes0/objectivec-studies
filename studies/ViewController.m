//
//  ViewController.m
//  studies
//
//  Created by Raphael on 3/17/19.
//  Copyright © 2019 Raphael. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mytextbox.text = nil;
    self.redval = 0.3;
    self.greenval = 0.15;
    self.blueval = 0.7;
    self.alpha = 0.7;
    [self.mylabel setFont:[UIFont fontWithName:@"Futura" size:90]];
    self.mylabel.adjustsFontSizeToFitWidth = YES;
    self.mylabel.layer.shadowColor = [[UIColor blackColor] CGColor];
}

- (IBAction)mybutton:(id)sender {
    self.mylabel.text = self.myinput.text;
    [self resignFirstResponder];
}

- (IBAction)setcolor:(id)sender {
    [self updateColor];
}

- (IBAction)handleRed:(id)sender {
    self.redval += 0.05;
    [self updateColor];
}

- (IBAction)handleGreen:(id)sender {
    self.greenval += 0.05;
    [self updateColor];
}

- (IBAction)handleBlue:(id)sender {
    self.blueval += 0.05;
    [self updateColor];
}

- (IBAction)handleAlpha:(id)sender {
    NSLog(@"%f", self.alpha);
    NSLog(@"is 1.0 ->%d", self.alpha > 1.0);
    if (self.alpha > 1.0) {
        self.alpha = 0;
    } else {
        self.alpha += 0.05;
    }
    
    [self updateColor];
}

- (void)updateColor{
        self.mylabel.textColor = [UIColor colorWithRed:self.redval green:self.greenval blue:self.blueval alpha:self.alpha];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%@", text);
    if ([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].length == 0) {
        return YES;
    }
    
    [textView resignFirstResponder];
    //textView.text = [textView.text stringByAppendingString: @"d"];
    //text = @"d";
    //NSLog(@"%@", text);
    return NO;
}
@end
