//
//  JSCMViewController.m
//  ColumbusMapsiOS
//
//  Created by Christopher Judd on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSCMViewController.h"
#import <MapKit/MapKit.h>

@interface JSCMViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation JSCMViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocations];
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}

- (void)loadLocations {
    
    
    CLLocationCoordinate2D coordinate = {40.001517, -83.019755};
    MKPointAnnotation* point = [MKPointAnnotation alloc];
    point.coordinate = coordinate;
    point.title = @"OSU Statium";
    point.subtitle = @"Home of the Ohio State Buckeyes";
    
    [mapView addAnnotation:point];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
