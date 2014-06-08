//
//  MainTableViewController.m
//  RottenTomatoes
//
//  Created by Bharath Rajendran on 6/8/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\bharat10. All rights reserved.
//

#import "MainTableViewController.h"
#import "MovieCell.h"
#import "SingelMovieViewViewController.h"

@interface MainTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *moviesArray;

@end

@implementation MainTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Movies";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    // anonymous method.
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //NSLog(@"%@", object);
        
        self.moviesArray =  object[@"movies"];
        [self.tableView reloadData];
        
    }
    ];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
    
    self.tableView.rowHeight = 150;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.moviesArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //cell.textLabel.text = [@(indexPath.row) stringValue] ;
    
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    NSLog(@"Cell Row :%d",indexPath.row);
    
    NSDictionary *movie = self.moviesArray[indexPath.row];
    cell.textLabel.text = movie[@"title"];
    
    
    movieCell.movieTitle.text = movie[@"title"];
    movieCell.movieSynopsis.text = movie[@"synopsis"];
  
   
    // get the posters which is a inner json object
    
    NSDictionary *posters = [movie objectForKey:@"posters"];
    NSURL *imageURL = [NSURL URLWithString:(NSString *) [posters objectForKey:@"thumbnail"]];
    
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    [movieCell.imageView setImage:[UIImage imageWithData:imageData]];
    
    return movieCell;

}

// Tap on table Row
- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {

    NSLog(@"callback Cell Row :%d",indexPath.row);
    SingelMovieViewViewController *smvc = [[SingelMovieViewViewController alloc]init];
    
    smvc.movie =self.moviesArray[indexPath.row];
    [self.navigationController pushViewController:smvc animated:YES];
    
}

@end
