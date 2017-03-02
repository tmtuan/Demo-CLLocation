//
//  ViewController.m
//  GetMyLocation
//
//  Created by ThaoLT on 3/2/17.
//  Copyright © 2017 tmtuan. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;


@end

@implementation ViewController

@synthesize locationManager=_locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000;
    
    // ask for permission to use location service on the user's device and tell the reason you need to use the service
    self.locationManager.purpose  = @"I would like to get your location so that I can show you your latitude and longitude";
    
    // Check if the location services are enabled
    if ([CLLocationManager locationServicesEnabled])
    {
        NSLog(@"Location Services Enabled");
        
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
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getLocation:(UIButton *)sender {
}
@end
