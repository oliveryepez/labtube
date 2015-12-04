//
//  VideoDetailViewController.h
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoDetailViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *currentVideoList;

@property (strong, nonatomic) IBOutlet UITextField *txtVideoTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtVideDescription;
@property (strong, nonatomic) IBOutlet UITextField *txtVideoURL;


@end
