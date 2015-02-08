//
//  MapViewController.m
//  WhereAmI
//
//  Created by cm2y on 2/2/15.
//  Copyright (c) 2015 cm2y. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;

@property (nonatomic, strong) NSMutableArray *mapAnnotations;

@property (strong,nonatomic) CLLocationManager *locationManager;

@property (strong,nonatomic) MKPointAnnotation*selectedAnnotation;

@property CLLocationCoordinate2D *userLocation;



- (IBAction)workButtonClicked:(id)sender;
- (IBAction)eatButtonClicked:(id)sender;
- (IBAction)playButtonClicked:(id)sender;

@end

@implementation MapViewController 

- (void)viewDidLoad {
    
    NSLog(@"viewDidLoad fired");
    
    [super viewDidLoad];
    
            //add notification observer - will just be listening for broadcast from @"ReminderAdded"
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderAdded:) name:@"ReminderAdded" object:nil];
    
    
        //initialise the location manager and become the delegate
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;

        //become the mapView delegate
            self.myMapView.delegate = self;
    
    
        //On load: zoom into South Lake Union
            //CLLocationCoordinate2D startingLocation = CLLocationCoordinate2DMake(47.623278,-122.337029);
    
            //define a zoom region
                //MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(startingLocation, 600, 600);//MKCoordinateRegionMakeWithDistance(origin, 2500, 2500);
    
            //show the location on the map
               // [self.myMapView setRegion:zoomRegion animated:YES];
    
    
    //Check if user has location data enabled
    if ([CLLocationManager locationServicesEnabled]) {
        
        
        NSLog(@"current status is %d", [CLLocationManager authorizationStatus]);
        
        //check if this app can use location data
        if ([CLLocationManager authorizationStatus] == 0) {
            
            [self.locationManager requestAlwaysAuthorization];
            
            
       } else {
            
                //show my current location on the map
            self.myMapView.showsUserLocation = true;
           
           
           
           
             NSLog(@"SHOWING USER LOCATION");
           
            [self.locationManager startMonitoringSignificantLocationChanges];
            
        }
        
    } else {
        
        //SET ALERT: warn the user that location services are not currently enabled
        
    }
    
    
        //initialise the long press gesture recogniser
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(userLongPressedOnMapSoAddNewAnnotation:)];
    
        //add it to view
            [self.myMapView addGestureRecognizer:longPress];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//detects when device is autorotated


//MARK: - User Actions --------------------------------------------------------------


    //User adds new annotation pin to map


- (IBAction)workButtonClicked:(id)sender {
    
    NSLog(@"workButtonClicked fired");
    
    //WORK: Set Map location to Code Fellows (47.623482, -122.335965)
    
    //On load: zoom into South Lake Union
    CLLocationCoordinate2D workLocation = CLLocationCoordinate2DMake(47.623482,-122.335965);
    
    //define a zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(workLocation, 200, 200);
    
    //show the location on the map
    [self.myMapView setRegion:zoomRegion animated:YES];
    
    
}


- (IBAction)eatButtonClicked:(id)sender {
    
    NSLog(@"eatButtonClicked fired");
    
    //EAT: Set map location to Portage Bay Cafe (47.621880, -122.337357)
    
    //On load: zoom into South Lake Union
    CLLocationCoordinate2D eatLocation = CLLocationCoordinate2DMake(47.621880, -122.337357);
    
    //define a zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(eatLocation, 200, 200);
    
    //show the location on the map
    [self.myMapView setRegion:zoomRegion animated:YES];
    
    
}



- (IBAction)playButtonClicked:(id)sender {
    
    NSLog(@"playButtonClicked fired");
    
    //PLAY: Set Map location to Zombie Room Escape Game (47.625489, -122.343966) 603 Roy St
    
    //On load: zoom into South Lake Union
    CLLocationCoordinate2D playLocation = CLLocationCoordinate2DMake(47.625489, -122.343966);
    
    //define a zoom region
    MKCoordinateRegion zoomRegion = MKCoordinateRegionMakeWithDistance(playLocation, 200, 200);
    
    //show the location on the map
    [self.myMapView setRegion:zoomRegion animated:YES];
    
    
}



-(void)zoomInOnMap:(id)sender {
    
    UITapGestureRecognizer *doubleTap = (UITapGestureRecognizer *)sender;
    NSLog(@"zoomInOnMap fired");
    
    //when the user lets go of press
    if (doubleTap.state == 1 ) {
        
        MKCoordinateRegion theRegion = self.myMapView.region;
        
        theRegion.span.longitudeDelta *= 0.5;
        theRegion.span.latitudeDelta *= 0.5;
        
        [self.myMapView setRegion:theRegion animated:YES];
        
        
    }
    
}



-(void)userLongPressedOnMapSoAddNewAnnotation:(id)sender {
    NSLog(@"userLongPressedOnMapSoAddNewAnnotation fired");
    
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    NSLog(@"MAP LONGPRESSED fired");
    
        //when the user lets go of press
    if (longPress.state == 3 ) {
        
        NSLog(@"long press ended");
        
        CGPoint location = [longPress locationInView:self.myMapView];
        
        NSLog(@"location y: %f location x: %f",location.y, location.x);
        
        CLLocationCoordinate2D coordinates = [self.myMapView convertPoint:location toCoordinateFromView:self.myMapView];
        
        
        NSLog(@"coordinate long: %f coordinate lat x: %f",coordinates.longitude, coordinates.latitude);
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        
        annotation.coordinate = coordinates;
        
        annotation.title = @"New Location";
        
        [self.myMapView addAnnotation:annotation];

    }
    
}


//pass the pin location with the segue to the AddReminderDetail VC
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
NSLog(@"prepareForSegue fired");
    
    
    if ([segue.identifier isEqualToString:@"SHOW_DETAIL"]) {
        
        //show segue path
        AddReminderDetailViewController *addReminderVC = (AddReminderDetailViewController *)segue.destinationViewController;
        
        //add values being passed
        addReminderVC.annotation = self.selectedAnnotation;
        addReminderVC.locationManager = self.locationManager;
        
    }
}


//MARK: - Map Regions ------------------------------------------------------------


-(void) reminderAdded:(NSNotification *)notification {
    NSLog(@"reminderAdded fired");
    
    NSDictionary *userInfo = notification.userInfo;
    CLCircularRegion *region = userInfo[@"reminder"];
    
    MKCircle *circleOverlay = [MKCircle circleWithCenterCoordinate:region.center radius:region.radius];
    
    [self.myMapView addOverlay:circleOverlay];
}


//MARK: - MapView ---------------------------------------------------------------


-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    NSLog(@"rendererForOverlay fired");
    
    MKCircleRenderer *circleRenderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
    circleRenderer.fillColor = [UIColor blueColor];
    circleRenderer.strokeColor = [UIColor redColor];
    circleRenderer.alpha = 0.15;
    return circleRenderer;
}


//customize the annotation pin
//TAPING A PIN ONLY SHOWS CALLOUT IN PORTRAIT - NOT SURE WHY (CONSTRAINTS?)
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
     NSLog(@"viewForAnnotation fired");


    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];

    annotationView.animatesDrop = true;

    annotationView.pinColor = MKPinAnnotationColorPurple;

    annotationView.canShowCallout = true;

    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];

    [self.myMapView setTranslatesAutoresizingMaskIntoConstraints:NO];

    return annotationView;
    
}




//segue to the AddReminderDetail VC
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    NSLog(@"calloutAccessoryControlTapped fired");
    
    self.selectedAnnotation = view.annotation;
    
    
    [self performSegueWithIdentifier:@"SHOW_DETAIL" sender:self];
    
    
    NSLog(@"button tapped, annotation %@",self.selectedAnnotation.title);
    
    
}



//must implement this with the Delegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    NSLog(@"didUpdateUserLocation fired");
    
    
}



//MARK: - LOCATION MANAGER METHODS ----------------------------------------------


-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"didEnterRegion fired");
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = @"region entered!";
    localNotification.alertAction = @"region action";
    //localNotification.fireDate = //some Date
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];

}




-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    NSLog(@"locationManager:didChangeAuthorizationStatus fired");
    
    NSLog(@" the new status is %d", status);
    
}




-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    NSLog(@"locationManager:didUpdateLocations fired, a new region was added to monitor");
    
    CLLocation *location = locations.firstObject;
    NSLog(@"latitide: %f and longitude: %f",location.coordinate.latitude, location.coordinate.longitude);
    
}



@end