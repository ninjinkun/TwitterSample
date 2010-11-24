//
//  TimelineEntry.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimelineEntryPosition;

@interface TimelineEntry : NSObject

@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *profileImageUrl;
@property (nonatomic, retain) TimelineEntryPosition *position;

-(id)initWithDictionary:(NSDictionary *)dict;
+(id)entryWithDictionary:(NSDictionary *)dict;

@end
