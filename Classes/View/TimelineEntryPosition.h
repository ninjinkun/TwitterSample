//
//  TimelineEntryPosition.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#define CELL_RIGHT_MARGIN 4
#define CELL_LEFT_MARGIN 4
#define CELL_TOP_MARGIN 4
#define CELL_BOTTOM_MARGIN 4
#define CELL_WIDTH 320
#define CELL_MAX_HEIGHT 400

#define ICON_SIZE 32
#define ICON_RIGHT_MARGIN 4

#define NAME_FONT_SIZE 14
#define NAME_BOTTOM_MARGIN 4

#define TEXT_FONT_SIZE 14
#define TEXT_LEFT_MARGIN (CELL_LEFT_MARGIN + ICON_SIZE + ICON_RIGHT_MARGIN)
#define TEXT_MAX_WIDTH (CELL_WIDTH - TEXT_LEFT_MARGIN - CELL_RIGHT_MARGIN)

#import <Foundation/Foundation.h>

@class TimelineEntry;

@interface TimelineEntryPosition : NSObject

@property (nonatomic, assign) CGRect textRect;
@property (nonatomic, assign) CGRect nameRect;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, readonly, assign) CGRect iconRect;

-(id)initWithEntry:(TimelineEntry *)entry;
+(id)positionWithEntry:(TimelineEntry *)entry;
-(void)caclculatePosition:(TimelineEntry *)entry;
@end
