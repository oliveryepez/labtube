//
//  VideoListViewControllerTableViewController.m
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import "VideoListViewControllerTableViewController.h"
#import "VideoCellTableViewCell.h"
#import "VideoDetailViewController.h"
#import <DCCoreDataManager.h>
#import "Video.h"

@interface VideoListViewControllerTableViewController ()



@end

@implementation VideoListViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    _videoList = [NSMutableArray arrayWithObjects:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4",
//                 @"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
//                 @"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8",
//                 @"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8",
//                 @"http://playertest.longtailvideo.com/adaptive/captions/playlist.m3u8",
//                 nil];
    
    _videoList = [[DCCoreDataManager sharedInstance] getEntities:@"Video"];
    [_tableVideoList reloadData];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFininsh:)
                                                 name:MPMoviePlayerDidExitFullscreenNotification
                                               object:self.videoPlayer];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_videoList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell" forIndexPath:indexPath];
    NSManagedObject *video = [_videoList objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = [_videoList objectAtIndex:indexPath.row];
    cell.lblVideoTitle.text = [video valueForKey:@"name"];
    cell.lblVideoDescription.text = [video valueForKey:@"desc"];
    cell.lblVideoURL.text = [video valueForKey:@"url"];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    VideoCellTableViewCell *videoCell = (VideoCellTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    [self playVideo:videoCell.lblVideoURL.text];
}


-(void) playVideo : (NSString *) videoRoute
{
    NSURL *videoURL = [NSURL URLWithString:videoRoute];
    
    self.videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
    [self.videoPlayer setControlStyle:MPMovieControlStyleDefault];
    self.videoPlayer.scalingMode = MPMovieScalingModeAspectFit;
    
    
    [self.videoPlayer.view setFrame:self.view.bounds];
    [self.view addSubview:self.videoPlayer.view];
    [self.videoPlayer setFullscreen:YES animated:YES];
    [self.view bringSubviewToFront:self.videoPlayer.view];
    
    [self.videoPlayer prepareToPlay];
    [self.videoPlayer stop];
    [self.videoPlayer play];
}

-(void) moviePlayBackDidFininsh :(NSNotification *) notification
{
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player
     ];
    
    if([player
        respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
}

-(IBAction)prepareForUnwindVideoDetail:(UIStoryboardSegue *)segue {
    if([segue.identifier isEqual:@"addVideoSegue"]){
        VideoDetailViewController *addVideoController = (VideoDetailViewController *)segue.sourceViewController;
        if(addVideoController.txtVideoURL.text){
            
            NSString *name = addVideoController.txtVideoTitle.text;
            NSString *desc = addVideoController.txtVideDescription.text;
            NSString *url  = addVideoController.txtVideoURL.text;
            
            [self addNewVideo:name :desc :url];
            _videoList = [[DCCoreDataManager sharedInstance] getEntities:@"Video"];
            [_tableVideoList reloadData];
        }
    }
}

-(void)addNewVideo:(NSString *)name :(NSString *) desc :(NSString *) url
{
    NSMutableDictionary *entityValues = [NSMutableDictionary dictionary];
    [entityValues setObject:name forKey:@"name"];
    [entityValues setObject:desc forKey:@"dec"];
    [entityValues setObject:url forKey:@"url"];
    
    [[DCCoreDataManager sharedInstance] saveEntity:@"Video" withValues:entityValues];
    [[DCCoreDataManager sharedInstance]saveContext];
}


@end
