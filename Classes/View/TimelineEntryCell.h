//
//  TimelineEntryCell.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TimelineEntry;
@class ImageDownloader;

@interface TimelineEntryCell : UITableViewCell

@property (nonatomic, retain) TimelineEntry *entry;
@property (nonatomic, assign) ImageDownloader *imageDownloader;

@end
