//
//  DataService.m
//  MovieApp
//
//  Created by Karumba Samuel on 25/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "DataService.h"
#import "Film.h"

@implementation DataService
@synthesize delegate=_delegate;

-(NSMutableArray *) selectFromJson:(NSString *)searchParam{
    NSMutableArray *masterList = [[NSMutableArray alloc] init];
    NSString *s_response = [self makeApiCall:searchParam];
    NSError __autoreleasing **error = nil;

    NSData *dataStream = [self converResponseToDataStream:s_response];
    
    if (dataStream != nil) {
        NSDictionary *s_dict = [NSJSONSerialization JSONObjectWithData:dataStream options:kNilOptions error:error];

        NSArray *searchResult = [s_dict objectForKeyedSubscript:@"Search"];

        if ([searchResult count] > 0) {
            for (NSDictionary *movie in searchResult) {
                    Film * i_film = [[Film alloc] initWithAttributes:movie];
                    
                    [masterList addObject:i_film];
                    
                }
        }

    }
    
    return masterList;
}

-(NSString *)makeApiCall:(NSString *)parameter{
    NSString *response = @"";
    
//    http://www.omdbapi.com/?
    NSString *baseURL = [DataService baseAPIUrl];
    
    
//    s=star%20wars
    
    baseURL = [baseURL stringByAppendingString:parameter];
    
//   url =  http://www.omdbapi.com/?s=star wars
    NSURL *encodedURL = [NSURL URLWithString:[DataService encodeURIComponent:baseURL]];
    
//    jsonUrl = http://www.omdbapi.com/?s=star%20wars
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    if (connection == nil) {
        connection = [AppDelegate initiateURLConnection:encodedURL];
    }
    
    NSError *error = nil;
    response= [NSString stringWithContentsOfURL:encodedURL encoding:NSUTF8StringEncoding error:&error];
    
    
    return response;
    
}


- (NSData*) converResponseToDataStream: (NSString *) response{
    
    return  [response dataUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *)baseAPIUrl{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    
    return [infoDictionary objectForKey:kBaseAPIUrl];
    
}
//
+ (NSString *)encodeURIComponent:(NSString *)string
{
    NSString *s = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return s;
}
//
//+ (NSString *)decodeURIComponent:(NSString *)string
//{
//    NSString *s = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    return s;
//}
//
@end
