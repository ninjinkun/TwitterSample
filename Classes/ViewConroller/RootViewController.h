//
//  RootViewController.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimelineEntriesController.h"

@interface RootViewController : UITableViewController <TimelineEntriesControllerDelegate, UITableViewDataSource>

@property (nonatomic, retain) TimelineEntriesController *entriesController;

-(IBAction)reloadButtonPushed:(id)sender;
-(void)reload;

@end
