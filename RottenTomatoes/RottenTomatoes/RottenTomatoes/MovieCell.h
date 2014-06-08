//
//  MovieCell.h
//  RottenTomatoes
//
//  Created by Bharath Rajendran on 6/8/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\bharat10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieSynopsis;
@property (weak, nonatomic) IBOutlet UIImageView *movieAlbumImage;

@end
