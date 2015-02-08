//
//  AddReminderDetailViewController.h
//  WhereAmI
//
//  Created by cm2y on 2/3/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapViewController.h"



@interface AddReminderDetailViewController : UIViewController

@property (strong,nonatomic) MKPointAnnotation *annotation;
@property (strong,nonatomic) CLLocationManager *locationManager;


@end
