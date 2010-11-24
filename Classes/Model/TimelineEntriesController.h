//
//  TimelineEntriesController.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#define TIMELINE_API @"http://api.twitter.com/1/statuses/public_timeline.json"

#import <Foundation/Foundation.h>

@interface TimelineEntriesController : NSObject

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSMutableArray *entries;

-(void)getEntries;

@end


@protocol TimelineEntriesControllerDelegate <NSObject>

-(void)getEntreiesFinished:(NSArray *)gotEntries;

@end