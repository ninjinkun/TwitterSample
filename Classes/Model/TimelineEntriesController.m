//
//  TimelineEntriesController.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/22/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimelineEntriesController.h"
#import "ASIHTTPRequest.h"
#import "JSON.h"
#import "TimelineEntry.h"

@interface TimelineEntriesController()
@property (nonatomic, retain) ASIHTTPRequest *req;
@end

@implementation TimelineEntriesController
@synthesize delegate, entries, req;

-(void)getEntries {
    self.req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:TIMELINE_API]];
    self.req.delegate = self;
    [self.req startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest *)res {
    NSArray *rawEntries = [[res responseString] JSONValue];
    self.entries = [NSMutableArray array];
    for (NSDictionary *rawEntry in rawEntries) {
        [self.entries addObject:[TimelineEntry entryWithDictionary:rawEntry]];
    }
    if ([delegate respondsToSelector:@selector(getEntreiesFinished:)]) {
        [delegate getEntreiesFinished:entries];
    }
}

-(void)dealloc {
    self.req.delegate = nil;
    self.req = nil;
    self.entries = nil;
    [super dealloc];
}

@end
