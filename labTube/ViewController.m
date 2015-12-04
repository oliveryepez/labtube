//
//  ViewController.m
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *videoList;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    videoList = [NSArray arrayWithObjects:@"http://download.blender.org/peach/bigbuckbunny_movies/BigBuckBunny_320x180.mp4",
                                          @"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
                                          @"http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8",
                                          @"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8",
                                          @"http://playertest.longtailvideo.com/adaptive/captions/playlist.m3u8",
                                        nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFininsh:)
                                                 name:MPMoviePlayerDidExitFullscreenNotification
                                               object:self.videoPlayer];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [videoList count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"TableCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier];
    }
    
    cell.textLabel.text = [videoList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self playVideo:[tableView cellForRowAtIndexPath:indexPath].textLabel.text];
    
}




@end
