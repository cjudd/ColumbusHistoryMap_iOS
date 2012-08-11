//
//  JSCMHistoryMarker.h
//  ColumbusMapsiOS
//
//  Created by Christopher Judd on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface JSCMHistoryMarker : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, assign) BOOL church;

+ (JSCMHistoryMarker*)createHistoryMarker:(NSString*) name latitude: (CLLocationDegrees)lat longitude:(CLLocationDegrees)lng;
+ (JSCMHistoryMarker*)createChurchMarker:(NSString*) name latitude: (CLLocationDegrees)lat longitude:(CLLocationDegrees)lng;

@end
