//
//  InterfaceController.m
//  WhereAmI WatchKit Extension
//
//  Created by cm2y on 2/6/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import "InterfaceController.h"
#import "ReminderRowController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "AddReminderDetailViewController.h"



@interface InterfaceController()

@property (strong, nonatomic) IBOutlet WKInterfaceTable *table;
@property (strong,nonatomic) NSArray *regionsArray;


@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    CLLocationManager *locationManager = [CLLocationManager new];
    NSSet *regions = locationManager.monitoredRegions;
    self.regionsArray = regions.allObjects;
    
    [self.table setNumberOfRows:regions.count withRowType:@"ReminderRowController"];
    NSInteger index = 0;
    for (CLRegion *region in self.regionsArray) {
        ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
        [rowController.reminderLabel setText:region.identifier];
        index++;
    }
    
    //NSArray *names = @[@"ALICE",@"BOB",@"CAROL",@"DAN",@"EMILY"];
    //[self.table setNumberOfRows:names.count withRowType:@"ReminderRowController"];
    //NSInteger index = 0;
    //ReminderRowController *rowController = [self.table rowControllerAtIndex:index];
    //[rowController.reminderLabel setText:names[index]];
    //index++;

}

-(id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    return self.regionsArray[rowIndex];
}


- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}


- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



