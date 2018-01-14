//
//  ViewController.m
//  DemoControls
//
//  Created by Rushi's on 14/01/18.
//  Copyright © 2018 Rushi's. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) NSTimer * myTimer ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // UIbutton -> UIControl -> UiView -> UIResponder -> NSObject
    
    _myLabel.text = @"This is the first label" ;
    _myLabel.textAlignment = NSTextAlignmentCenter ;
    
    
    [_myButton setTitle:@"Submit" forState:UIControlStateNormal];
    [_myButton addTarget:self
                  action:@selector(demoMethod)
        forControlEvents:UIControlEventTouchUpInside];
    
    _mySegControl.selectedSegmentIndex = 1 ;
    [_mySegControl addTarget:self
                      action:@selector(mySegmentClicked:)
            forControlEvents:UIControlEventValueChanged];

    
    _myTextfield.placeholder = @"Enter text here" ;
    _myTextfield.secureTextEntry = YES ;
    _myTextfield.delegate = self ;
    
    
    
    _mySlider.minimumValue = 1.0 ;
    _mySlider.value = 500.0 ;
    _mySlider.maximumValue = 1000.0 ;
    [_mySlider addTarget:self
                  action:@selector(sliderTrackerMethod:)
        forControlEvents:UIControlEventValueChanged];
    
    
    _mySwitch.on = false ;
    [_mySwitch addTarget:self
                  action:@selector(switchValueChanged:)
        forControlEvents:UIControlEventValueChanged];
    
    
    [_myIndicator startAnimating];
    _myIndicator.color = [UIColor yellowColor];
    _myIndicator.frame = CGRectMake(self.view.frame.size.width/2 - 50,
                                    _mySwitch.frame.origin.y + _mySwitch.frame.size.height + 20,
                                    100, 100);
    
    _myProgressBar.progress = 0.0 ;
    // set progress value count

//    _myTimer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        [self updateTimer];
//    }];
    

}


-(void)demoMethod{
    NSLog(@"Demo Method executed");
    [_myIndicator stopAnimating];
}

-(void)updateTimer{
    NSLog(@"PROGRESS VALUE BEFORE: %f",_myProgressBar.progress);
    _myProgressBar.progress += 0.01;

    if (_myProgressBar.progress >= 0.99) {
        NSLog(@"PROGRESS VALUE AFTER: %f",_myProgressBar.progress);

        [_myTimer invalidate];
        
    }
    
 }


-(void)mySegmentClicked:(UISegmentedControl *)segControl{
    if (segControl.selectedSegmentIndex == 0) {
        NSLog(@"First segment is clicked");
    }else{
        NSLog(@"The second segment is clicked");
    }
}


-(void)sliderTrackerMethod:(UISlider *)slider{
    if (slider == _mySlider) {
        NSLog(@"The value of the slider is : %f", slider.value);
    }
}

-(void)switchValueChanged:(UISwitch *)currentSwitch{

    NSLog(@"Value for switch : %d", currentSwitch.on);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - UITEXTFIELD DELEGATE METHODS

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (_mySwitch.isOn) {
        return YES ;
    }else{
        UIAlertView * myAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Change the button name" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
        [myAlert show];
        return NO ;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"did begin editing is called");
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"did end editing is called");
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string{
    
    return YES ;
}

@end
