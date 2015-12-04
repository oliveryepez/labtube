//
//  ViewController.h
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MediaPlayer;

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) MPMoviePlayerController *videoPlayer;

@end

