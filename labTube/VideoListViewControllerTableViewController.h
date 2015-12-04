//
//  VideoListViewControllerTableViewController.h
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MediaPlayer;

@interface VideoListViewControllerTableViewController : UITableViewController

@property(strong, nonatomic) MPMoviePlayerController *videoPlayer;
@property(strong, nonatomic) NSArray *videoList;
@property (strong, nonatomic) IBOutlet UITableView *tableVideoList;


@end
