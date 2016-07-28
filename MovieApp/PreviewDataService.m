//
//  PreviewDataService.m
//  MovieApp
//
//  Created by Karumba Samuel on 28/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "PreviewDataService.h"

@implementation PreviewDataService

-(PreviewFilm *) getFilmPreviewFromAPI:(NSString *)urlParameter{
    PreviewFilm *previewDetails;
    

    NSString *s_response = [self makeApiCall:urlParameter];
    NSError __autoreleasing **error = nil;

    NSData *dataStream = [self converResponseToDataStream:s_response];


    if (dataStream != nil) {
        NSDictionary *s_dict = [NSJSONSerialization JSONObjectWithData:dataStream options:kNilOptions error:error];
        
        previewDetails = [[PreviewFilm alloc] initWithAttributes:s_dict];
    
    }
    return previewDetails;
    
}
@end
