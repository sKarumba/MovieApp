//
//  DataService.h
//  MovieApp
//
//  Created by Karumba Samuel on 25/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataService.h"

@interface SearchDataService : BaseDataService


-(NSMutableArray *) getSearchedFilmFromAPI:(NSString *)searchParam;



@end
