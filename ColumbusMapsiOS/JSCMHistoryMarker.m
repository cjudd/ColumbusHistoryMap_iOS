//
//  JSCMHistoryMarker.m
//  ColumbusMapsiOS
//
//  Created by Christopher Judd on 6/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSCMHistoryMarker.h"

@implementation JSCMHistoryMarker

@synthesize coordinate;
@synthesize name;
@synthesize description;
@synthesize church;

- (NSString *)title {
	return name;
}

- (NSString *)subtitle {
	return description;
}

+ (JSCMHistoryMarker*)createHistoryMarker:(NSString*) name latitude: (CLLocationDegrees)lat longitude:(CLLocationDegrees)lng {
    CLLocationCoordinate2D coordinate = {lat, lng};
	JSCMHistoryMarker* marker = [JSCMHistoryMarker alloc];
    marker.coordinate = coordinate;
    marker.name = name;
    
	return marker;
}

+ (JSCMHistoryMarker*)createChurchMarker:(NSString*) name latitude: (CLLocationDegrees)lat longitude:(CLLocationDegrees)lng {
    JSCMHistoryMarker* marker = [JSCMHistoryMarker createHistoryMarker:name latitude:lat longitude:lng];
    marker.church = YES;
    
    return marker;
}

@end

