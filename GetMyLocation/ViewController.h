//
//  ViewController.h
//  GetMyLocation
//
//  Created by ThaoLT on 3/2/17.
//  Copyright © 2017 tmtuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitubeLabel;

- (IBAction)getLocation:(UIButton *)sender;

@end

