//
//  SingelMovieViewViewController.h
//  RottenTomatoes
//
//  Created by Bharath Rajendran on 6/8/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\bharat10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingelMovieViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *detailedImage;

@property (weak, nonatomic) IBOutlet UILabel *detailedDescription;

@property (nonatomic, strong) NSDictionary *movie;


@end
