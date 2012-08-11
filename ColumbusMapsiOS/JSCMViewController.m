//
//  JSCMViewController.m
//  ColumbusMapsiOS
//
//  Created by Christopher Judd on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSCMViewController.h"
#import <MapKit/MapKit.h>
#import "JSCMHistoryMarker.h"

@interface JSCMViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation JSCMViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadLocations];
    [self loadHistoricalMarkers];
    mapView.delegate = self;
}

- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id < MKAnnotation >)annotation {
    if(annotation == mapView.userLocation) {return nil;}
    
    MKAnnotationView *annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"marker"];
    if(nil == annotationView) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"marker"];
        annotationView.image = [UIImage imageNamed:@"history.png"];
    }
    
    return annotationView;
}

- (void)mapView:(MKMapView *)aMapView regionDidChangeAnimated:(BOOL)animated {
    MKCoordinateRegion region = aMapView.region;
    NSLog(@"Current local - {%f, %f} span (%f, %f)", 
          region.center.latitude, region.center.longitude, 
          region.span.latitudeDelta, region.span.longitudeDelta );
}

- (IBAction)zoomCurrentLocation:(id)sender {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(
                    mapView.userLocation.location.coordinate, 500, 500);
    [mapView setRegion:region animated:TRUE];
}

- (IBAction)zoomColumbus:(id)sender {
    CLLocationCoordinate2D columbusCenterCoordinate = {39.971793, -82.983396};
    MKCoordinateSpan span = MKCoordinateSpanMake(0.390456, 0.390456);
    MKCoordinateRegion region = MKCoordinateRegionMake(columbusCenterCoordinate, span);
    [mapView setRegion:region animated:TRUE];
}

- (void)loadLocations {
    
    CLLocationCoordinate2D coordinate = {40.001517, -83.019755};
    MKPointAnnotation* point = [MKPointAnnotation alloc];
    point.coordinate = coordinate;
    point.title = @"OSU Statium";
    point.subtitle = @"Home of the Ohio State Buckeyes";
    
    [mapView addAnnotation:point];
}

- (void) loadHistoricalMarkers {
    NSMutableArray* markers = [[NSMutableArray alloc] initWithCapacity:35];
    
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Hanna Neil Mission and Home for the Friendless" latitude: 39.958064 longitude:-82.98013]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"In Memory of Ovid Wellford Smith" latitude: 39.940064 longitude: -83.01996]];	
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Deaf School Park" latitude: 39.960307 longitude: -82.98685]];	
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Formerly Maryland Park" latitude: 39.975415 longitude: -82.96537]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Starling Medical College and St. Francis Hospital" latitude: 39.960997 longitude: -82.99045]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Camp Chase" latitude: 39.943513 longitude: -83.0755]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Birthplace of the Veterans of Foreign Wars" latitude: 39.95704 longitude: -82.99159]];		 
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Merion Village" latitude: 39.936373 longitude: -82.98804]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Old Ohio Union" latitude: 39.997002 longitude: -83.01133]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Green Lawn Cemetery" latitude: 39.940064 longitude: -83.0205]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"The National Road" latitude: 39.955563 longitude: -83.0593]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Roy J. Plunkett, June 26, 1910-May 12, 1994" latitude: 40.002236 longitude: -83.01255]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Anne O'Hare McCormick 1880-1954" latitude: 39.989366 longitude: -82.94333]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Monsignor John Joseph Jessing" latitude: 40.1189 longitude: -83.0165]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Trinity Lutheran Seminary" latitude: 39.948114 longitude: -82.99785]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Iskcon Krishna House" latitude: 39.992127 longitude: -83.01713]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Ohio Agricultural Experiment Station" latitude: 40.004784 longitude: -83.02713]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Xerography" latitude: 39.990598 longitude: -83.01998]];
    [markers addObject:[JSCMHistoryMarker createChurchMarker:@"St. Paul African Methodist Episcopal Church" latitude: 39.966964 longitude: -82.9834]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Jesse Owens" latitude: 40.012314 longitude: -83.02796]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Ohio State School for the Blind" latitude: 40.068763 longitude: -83.019]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"The Ohio State Fair" latitude: 40.000943 longitude: -82.98899]];
    [markers addObject:[JSCMHistoryMarker createChurchMarker:@"St. Patrick Church" latitude: 39.969233 longitude: -82.99192]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"George Bellows" latitude: 39.960805 longitude: -83.01365]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Asians in the American Civil War" latitude: 39.967818 longitude: -82.95333]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Wilber H. Siebert Collection" latitude: 40.000833 longitude: -83.01569]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"James Thurber" latitude: 39.966191 longitude: -82.98466]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"The Ohio Statehouse" latitude: 39.962264 longitude: -83.0005]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"General Curtis E. LeMay" latitude: 40.005061 longitude: -83.0171]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Tod Barracks, 1863" latitude: 39.972984 longitude: -83.00252]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Coach Woody Hayes" latitude: 40.011754 longitude: -83.02214]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Reverend Father Alexander Cestelli" latitude:	39.977641 longitude: -82.99898]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"Ohio School for the Deaf" latitude: 40.061963 longitude: -83.00642]];
    [markers addObject:[JSCMHistoryMarker createHistoryMarker:@"St. Clair Hospital" latitude:	39.9717431 longitude: -82.98071583]];
    
    [mapView addAnnotations: markers];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
