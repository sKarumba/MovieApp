//
//  ListViewController.h
//  MovieApp
//
//  Created by Karumba Samuel on 22/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Film.h"
#import "PreviewFilm.h"

@interface PreviewViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgPoster;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property(nonatomic,retain) Film *film;
@property(nonatomic,retain) PreviewFilm *filmPreview;


-(void) designUI:(PreviewFilm *) preview;

@end
