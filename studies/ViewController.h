//
//  ViewController.h
//  studies
//
//  Created by Raphael on 3/17/19.
//  Copyright © 2019 Raphael. All rights reserved.
//

#import <UIKit/UIKit.h>
//To take advantage of CIFilters, you have to import the Core Image framework
#import <CoreImage/CoreImage.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property CGFloat redval;
@property CGFloat greenval;
@property CGFloat blueval;
@property CGFloat alpha;
@property UIImage *initialImage;

@property (weak, nonatomic) IBOutlet UILabel *mylabel;
@property (weak, nonatomic) IBOutlet UITextView *mytextbox;
@property (weak, nonatomic) IBOutlet UITextField *myinput;
- (IBAction)mybutton:(id)sender;
- (IBAction)setcolor:(id)sender;
- (IBAction)handleRed:(id)sender;
- (IBAction)handleGreen:(id)sender;
- (IBAction)handleBlue:(id)sender;
- (IBAction)handleAlpha:(id)sender;
- (IBAction)sup:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *myView;

@end

@interface CustomView : UIView

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event;

@end
