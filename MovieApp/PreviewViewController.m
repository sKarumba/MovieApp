//
//  ListViewController.m
//  MovieApp
//
//  Created by Karumba Samuel on 22/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import "PreviewViewController.h"
#import "PreviewDataService.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController
@synthesize film=_film, filmPreview=_filmPreview;
@synthesize imgPoster=_imgPoster, lblTitle=_lblTitle, lblDescription=_lblDescription;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *imdbID = _film.imdbID;
    
    NSString *urlParameter = [@"i=" stringByAppendingString:imdbID];
    
    [self fetchData:urlParameter];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)fetchData:(NSString *)urlParameter{
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        PreviewDataService *service = [[PreviewDataService alloc] init];
        
        _filmPreview = [service getFilmPreviewFromAPI:urlParameter];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self designUI:_filmPreview];
            [self.view reloadInputViews];
        });
    });
    

}

-(void) designUI:(PreviewFilm *)preview{
    _lblTitle.text = [@"Title: " stringByAppendingString:preview.title];
    [_lblDescription setText:preview.plot];
    
    _imgPoster.image = [UIImage imageNamed:@"newapp-icon"];

    // download the image asynchronously
    if (![preview.poster  isEqual: @"N/A"]) {
        [self downloadImageWithURL:[NSURL URLWithString:preview.poster] completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                // change the image in the cell
                _imgPoster.image = image;
                
            }
        }];
    }
    

    
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               if ( !error ){
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}


@end
