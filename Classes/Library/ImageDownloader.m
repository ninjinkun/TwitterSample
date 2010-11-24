//
//  ImageDownloader.m
//  TwitterSample
//
//  Created by 浅野 慧 on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ImageDownloader.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
@interface ImageDownloader ()
@property (nonatomic, retain) NSMutableDictionary *images;
@property (nonatomic, retain) ASINetworkQueue *queue;
@property (nonatomic, readonly, assign) UIImage *nullImage;
@end


@implementation ImageDownloader
@synthesize delegate, images, queue;

-(id)init {
    if (self = [super init]) {
        self.images = [NSMutableDictionary dictionary];
        self.queue = [ASINetworkQueue queue];
    }
    return self;
}

-(UIImage *)getImage:(NSString *)url {
    UIImage *cachedImage = [images objectForKey:url];
    if (cachedImage)  {
        return cachedImage;
    }    
    ASIHTTPRequest *req = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:url]];
    req.delegate = self;
    [self.queue addOperation:req];
    [self.queue setSuspended:NO];    
    [self.images setObject:self.nullImage  forKey:url];
    return nil;
}

-(void)requestFinished:(ASIHTTPRequest *)res {
    UIImage *image = [UIImage imageWithData:[res responseData]];
    // set cache
    if (image) {
        [self.images setObject:image forKey:[res.originalURL absoluteString]];
    }
    if ([delegate respondsToSelector:@selector(getImageFinished:)]) {
        [delegate getImageFinished:image];
    }
}

//singleton
-(UIImage *)nullImage {
    static UIImage *nullImage_ = nil;
    if (!nullImage_) {
        nullImage_ = [[UIImage alloc] init];
    }
    return nullImage_;
}

-(void)dealloc {
    self.images = nil;
    [queue cancelAllOperations];
    self.queue = nil;
    [super dealloc];
}

@end
