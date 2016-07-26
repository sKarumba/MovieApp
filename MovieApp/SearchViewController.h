//
//  SearchViewController.h
//  MovieApp
//
//  Created by Karumba Samuel on 21/07/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
{
    NSString *noResultText;

}

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(strong, nonatomic) NSMutableArray *masterFilmList;


@end
