//
//  SingelMovieViewViewController.m
//  RottenTomatoes
//
//  Created by Bharath Rajendran on 6/8/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\bharat10. All rights reserved.
//

#import "SingelMovieViewViewController.h"

@interface SingelMovieViewViewController ()

@end

@implementation SingelMovieViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    NSLog(@"new view log ");
    
    self.detailedDescription.text =self.movie[@"synopsis"];
    NSLog(@"%@", self.detailedDescription);
    
    NSDictionary *posters = [self.movie objectForKey:@"posters"];
    
    NSURL *imageURL = [NSURL URLWithString:(NSString *) [posters objectForKey:@"detailed"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    [self.detailedImage setImage:[UIImage imageWithData:imageData]];
    
   [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
