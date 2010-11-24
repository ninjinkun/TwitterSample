//
//  TimelineEntryCell.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimelineEntryCell.h"
#import "TimelineEntry.h"
#import "TimelineEntryPosition.h"
#import "ImageDownloader.h"

@implementation TimelineEntryCell
@synthesize entry, imageDownloader;

-(void)setEntry:(TimelineEntry *)newEntry {
    if (entry) {
        [entry release];
    }
    entry = [newEntry retain];
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect {
    [self.entry.name drawInRect:self.entry.position.nameRect withFont:[UIFont boldSystemFontOfSize:NAME_FONT_SIZE] lineBreakMode:UILineBreakModeTailTruncation];
    [self.entry.text drawInRect:self.entry.position.textRect withFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE]];
    UIImage* iconImage = [imageDownloader getImage:self.entry.profileImageUrl];
    [iconImage drawInRect:self.entry.position.iconRect];
}

-(void)dealloc {
    self.entry = nil;
    [super dealloc];
}

@end 
