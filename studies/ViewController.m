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
    [self.mylabel setFont:[UIFont fontWithName:@"Futura" size:30]];
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

- (IBAction)sup:(id)sender {
    [self blur];
    //NSLog(@"%@", self.initialView);
    //self.view.backgroundColor = [UIColor yellowColor];
}

- (void)blur{
    if (self.initialView == nil) {
        //Get a UIImage from the UIView
        UIGraphicsBeginImageContext(self.view.bounds.size);
        [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        self.initialView = viewImage;
        UIGraphicsEndImageContext();
    }
    
    //Blur the UIImage with a CIFilter
    CIImage *imageToBlur = [CIImage imageWithCGImage:self.initialView.CGImage];
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
    [gaussianBlurFilter setValue:[NSNumber numberWithFloat:10] forKey: @"inputRadius"];
    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
    UIImage *endImage = [[UIImage alloc] initWithCIImage:resultImage];
    
    //Place the UIImage in a UIImageView
    UIImageView *newView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    newView.image = endImage;
    self.view = newView;
    //[self.view addSubview:newView];
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
