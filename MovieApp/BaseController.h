//
//  BaseController.h
//  MovieApp
//
//  Created by Karumba Samuel on 02/08/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseController : UIViewController

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;

@end
