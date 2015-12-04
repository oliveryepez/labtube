//
//  VideoDetailViewController.m
//  labTube
//
//  Created by Oliiver Yepez on 12/2/15.
//  Copyright © 2015 Oliver Yepez. All rights reserved.
//

#import "VideoDetailViewController.h"

@interface VideoDetailViewController ()

@end


@implementation VideoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancelSegue:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)addNewVideo:(id)sender {
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}



@end
