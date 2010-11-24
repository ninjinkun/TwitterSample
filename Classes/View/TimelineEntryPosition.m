//
//  TimelineEntryPosition.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimelineEntryPosition.h"
#import "TimelineEntry.h"

@implementation TimelineEntryPosition
@synthesize textRect, nameRect, cellHeight;

-(id)initWithEntry:(TimelineEntry *)entry {
    if (self = [super init]) {
        [self caclculatePosition:entry];
    }
    return self;
}

+(id)positionWithEntry:(TimelineEntry *)entry {
    return [[[self alloc] initWithEntry:entry] autorelease];
}

-(void)caclculatePosition:(TimelineEntry *)entry {
    CGFloat y = CELL_TOP_MARGIN;
    
    CGSize nameSize = [entry.name sizeWithFont:[UIFont boldSystemFontOfSize:NAME_FONT_SIZE] forWidth:TEXT_MAX_WIDTH lineBreakMode:UILineBreakModeTailTruncation];
    self.nameRect = CGRectMake(TEXT_LEFT_MARGIN, y,nameSize.width, nameSize.height);
    
    y += nameSize.height + NAME_BOTTOM_MARGIN;
    
    CGSize textSize = [entry.text sizeWithFont:[UIFont systemFontOfSize:TEXT_FONT_SIZE] constrainedToSize:CGSizeMake(TEXT_MAX_WIDTH, CELL_MAX_HEIGHT) lineBreakMode:UILineBreakModeWordWrap];
    self.textRect = CGRectMake(TEXT_LEFT_MARGIN, y,textSize.width, textSize.height);
    
    y += textSize.height + CELL_BOTTOM_MARGIN;
    
    self.cellHeight = y < CELL_MAX_HEIGHT ? y : CELL_MAX_HEIGHT;    
}

-(CGRect)iconRect {
    return CGRectMake(CELL_TOP_MARGIN, CELL_LEFT_MARGIN, ICON_SIZE, ICON_SIZE);
}

@end
