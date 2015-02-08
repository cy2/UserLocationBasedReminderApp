//
//  WatchLocationsMap.m
//  WhereAmI
//
//  Created by cm2y on 2/8/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import "WatchLocationsMap.h"
#import <CoreLocation/CoreLocation.h>
#import <WatchKit/WatchKit.h>


@interface WatchLocationsMap()
@property (weak, nonatomic) IBOutlet WKInterfaceMap *locationMap;
@end



@implementation WatchLocationsMap

- (void)awakeWithContext:(id)context {
    
    [super awakeWithContext:context];

    self.currentRegion = context;
    
    MKCoordinateRegion selectedRegion = MKCoordinateRegionMake(self.currentRegion.center, MKCoordinateSpanMake(0.01, 0.01));
    
    [self.locationMap setRegion: selectedRegion];

    NSLog(@"displaying region is %@", self.currentRegion);
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
