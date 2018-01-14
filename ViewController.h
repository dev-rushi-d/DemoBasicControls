//
//  ViewController.h
//  DemoControls
//
//  Created by Rushi's on 14/01/18.
//  Copyright © 2018 Rushi's. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UIButton *myButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegControl;
@property (weak, nonatomic) IBOutlet UITextField *myTextfield;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *myIndicator;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgressBar;

@end

