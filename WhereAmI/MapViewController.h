//
//  MapViewController.h
//  WhereAmI
//
//  Created by cm2y on 2/2/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "AddReminderDetailViewController.h"



@interface MapViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong,nonatomic) MKPointAnnotation *annotation;

//@property CLLocationManager *locationManager:

@end
