//
//  VideoCellTableViewCell.h
//  labTube
//
//  Created by Oliiver Yepez on 12/3/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCellTableViewCell : UITableViewCell

@property(nonatomic, weak)IBOutlet UIImageView *thumbVideo;
@property(nonatomic, weak)IBOutlet UILabel *lblVideoTitle;
@property(nonatomic, weak)IBOutlet UILabel *lblVideoDescription;
@property(nonatomic, weak)IBOutlet UILabel *lblVideoURL;

@end
