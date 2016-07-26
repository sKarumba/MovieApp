//
//  DataService.h
//  MovieApp
//
//  Created by Karumba Samuel on 25/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface DataService : NSObject
{
    AppDelegate *delegate;
    NSURLConnection *connection;
}

@property(nonatomic,retain) AppDelegate *delegate;

-(NSMutableArray *) selectFromJson:(NSString *)searchParam;
+(NSString *) baseAPIUrl;
-(NSString *) makeApiCall:(NSString *)parameter;
- (NSData*) converResponseToDataStream: (NSString *) response;


@end
