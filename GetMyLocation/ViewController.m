//
//  ViewController.m
//  GetMyLocation
//
//  Created by ThaoLT on 3/2/17.
//  Copyright © 2017 tmtuan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () 

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic) BOOL locationOn;

@end

@implementation ViewController

@synthesize locationManager=_locationManager;
@synthesize locationOn=_locationOn;

#pragma mark - Actions
- (IBAction)getLocation:(UIButton *)sender
{
    if (self.locationOn == NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Geolocation"
                                                        message:@"I cannot find where you are"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    else
    {
        // start the location manager
        [self.locationManager startUpdatingLocation];
    }
    NSLog(@"get my location");
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.latitudeLabel.text = [[NSString alloc] initWithFormat:@"Latitude:%f", newLocation.coordinate.latitude];
    self.longitudeLabel.text = [[NSString alloc] initWithFormat:@"Longitude: %f", newLocation.coordinate.longitude];
    NSLog(@"Just updated my location");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000;
    
    // ask for permission to use location service on the user's device and tell the reason you need to use the service
    self.locationManager.purpose  = @"I would like to get your location so that I can show you your latitude and longitude";
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    
    // Check if the location services are enabled
    if ([CLLocationManager locationServicesEnabled])
    {
        NSLog(@"Location Services Enabled");
        
        self.locationOn = YES;
        
        // Switch through the possible location authorization states
        switch ([CLLocationManager authorizationStatus]) {
    
            case kCLAuthorizationStatusDenied:
                NSLog(@"Location services denied by user");
                break;
            case kCLAuthorizationStatusAuthorizedAlways:
                NSLog(@"Location services always available");
                
                break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
                NSLog(@"Location services available when the app is in use");
            default:
                break;
        }
        
    }
    else
    {
        NSLog(@"Location Services are disabled");
        self.locationOn = NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
