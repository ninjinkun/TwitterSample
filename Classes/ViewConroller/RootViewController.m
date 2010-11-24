//
//  RootViewController.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "TimelineEntriesController.h"
#import "TimelineEntry.h"
#import "TimelineEntryPosition.h"
#import "TimelineEntryCell.h"
#import "ImageDownloader.h"

@interface RootViewController ()
-(TimelineEntry *)entryAtIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, retain) ImageDownloader *imageDownloader;
@end

@implementation RootViewController
@synthesize entriesController, imageDownloader;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    if (!entriesController) {
        self.entriesController = [[[TimelineEntriesController alloc] init] autorelease];
        self.entriesController.delegate = self;
    }
    if (!imageDownloader) {
        self.imageDownloader = [[[ImageDownloader alloc] init] autorelease];
        self.imageDownloader.delegate = self;
    }    
    [self reload];
    [super viewDidLoad];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.entriesController.entries.count;
}

-(TimelineEntry *)entryAtIndexPath:(NSIndexPath *)indexPath {
    return  [self.entriesController.entries objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    
	TimelineEntry *entry = [self entryAtIndexPath:indexPath];
	return entry.position.cellHeight + 2.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    TimelineEntryCell *cell = (TimelineEntryCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[TimelineEntryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageDownloader = self.imageDownloader;
    }
    cell.entry = [self entryAtIndexPath:indexPath];
    return cell;
}

#pragma mark -
#pragma mark Entries controller methods

-(void)getEntreiesFinished:(NSArray *)gotEntries {
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

-(void)getImageFinished:(UIImage *)gotImage {
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

-(void)reload {
    [self.entriesController getEntries];
}

-(IBAction)reloadButtonPushed:(id)sender 
{
    [self reload];
}

- (void)dealloc {
    self.entriesController.delegate = nil;
    self.entriesController = nil;
    self.imageDownloader.delegate = nil;
    self.imageDownloader = nil;
    [super dealloc];
}


@end

