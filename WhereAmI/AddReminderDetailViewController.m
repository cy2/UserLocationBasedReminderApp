
//This class allows me to set a location reminder when a user drops an annotation on the map and also add some details to the annotation

//
//  AddReminderDetailViewController.m
//  WhereAmI
//
//  Created by cm2y on 2/3/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import "AddReminderDetailViewController.h"
#import "MapViewController.h"



@interface AddReminderDetailViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *updatePinName;
@property (strong, nonatomic) IBOutlet UITextField *updatePinDetails;

@end


@implementation AddReminderDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.updatePinName.delegate = self;
    self.updatePinDetails.delegate = self;
    
    //print the pin's coordinate once I try to add details to it
    NSLog(@"The pin's lat: %f and long: %f ", self.annotation.coordinate.longitude, self.annotation.coordinate.latitude);
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return");
    [textField resignFirstResponder];
    return YES;
}

    //add a Title to the callout
- (IBAction)addAnnotationTitle:(id)sender {

    
    self.annotation.title = _updatePinName.text;
    
    [_updatePinName resignFirstResponder];
    
    
}


    //add a subtitle to the callout
 - (IBAction)addAnnotationSubtitle:(id)sender {
    
    self.annotation.subtitle = _updatePinDetails.text;
    
    [_updatePinDetails resignFirstResponder];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressedAddReminderButton:(id)sender {

    
        //when the save button is clicked, create a location based reminder for the pin
    
    if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
        
        
        //create the region
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:self.annotation.coordinate radius:200 identifier:@"Reminder"];
        
        
        //tell the location manager to start monitoring for this region
        [self.locationManager startMonitoringForRegion:region]; //NSDictionary *userInfo = @{@"reminder" : region};
        
        
        //add the notification
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderAdded" object:self userInfo:@{@"reminder" : region,@"AnnotationView": self.annotation}];
        
        
        //close out the view controller - because I presented it modally
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                   
                                     //print what was broadcased
                                     NSLog(@"Sent back the annotation's new title: %@, subtitle %@ and region", self.annotation.title, self.annotation.subtitle);
                                 }];
        
    }
    
    
    
}

@end

