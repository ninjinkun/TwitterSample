//
//  ImageDownloader.h
//  TwitterSample
//
//  Created by 浅野 慧 on 11/24/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ImageDownloader : NSObject
@property (nonatomic, assign) id delegate;
-(UIImage *)getImage:(NSString *)url;
@end


@protocol ImageDownloaderDelegate <NSObject>

-(void)getImageFinished:(UIImage *)gotImage;

@end
