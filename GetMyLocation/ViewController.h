//
//  ViewController.h
//  GetMyLocation
//
//  Created by ThaoLT on 3/2/17.
//  Copyright © 2017 tmtuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;

- (IBAction)getLocation:(UIButton *)sender;

@end

