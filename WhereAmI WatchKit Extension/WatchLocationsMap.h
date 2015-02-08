//
//  WatchLocationsMap.h
//  WhereAmI
//
//  Created by cm2y on 2/8/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import <MapKit/MapKit.h>
#import "AddReminderDetailViewController.h"

@interface WatchLocationsMap : WKInterfaceController
@property (strong, nonatomic) CLCircularRegion *currentRegion;
@end

