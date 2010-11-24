//
//  TimelineEntry.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimelineEntry.h"
#import "TimelineEntryPosition.h"

@implementation TimelineEntry
@synthesize text, name, profileImageUrl, position;

-(id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        // アクセサ経由でretainして代入
        self.text = [dict objectForKey:@"text"];
        NSDictionary *userDict = [dict objectForKey:@"user"];
        if (userDict) {
            self.name = [userDict objectForKey:@"screen_name"];
            self.profileImageUrl = [userDict objectForKey:@"profile_image_url"];
        }
        // XXX Protocolにすれば綺麗に分離できそう        
        self.position = [TimelineEntryPosition positionWithEntry:self];
    }
    return self;
}

+(id)entryWithDictionary:(NSDictionary *)dict {
    return [[[self alloc] initWithDictionary:dict] autorelease];
}

-(void)dealloc {
    self.text = nil;
    self.name = nil;
    self.profileImageUrl = nil;
    self.position = nil;
    [super dealloc];
}

@end
