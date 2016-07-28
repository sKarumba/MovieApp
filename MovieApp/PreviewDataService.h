//
//  PreviewDataService.h
//  MovieApp
//
//  Created by Karumba Samuel on 28/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "BaseDataService.h"
#import "PreviewFilm.h"

@interface PreviewDataService : BaseDataService


-(PreviewFilm *) getFilmPreviewFromAPI:(NSString *)urlParameter;


@end
