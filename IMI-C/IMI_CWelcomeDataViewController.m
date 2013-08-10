//
//  IMI_CWelcomeDataViewController.m
//  IMI-C2.0
//
//  Created by Jeremy H. Shi on 8/10/13.
//  Copyright (c) 2013 Jeremy. All rights reserved.
//

#import "IMI_CWelcomeDataViewController.h"

@interface IMI_CWelcomeDataViewController ()

@end

@implementation IMI_CWelcomeDataViewController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setImi_cResults{
    NSDate *date=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    NSString *dateString=[dateFormatter stringFromDate:date];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    self.dataArray = [NSArray arrayWithObjects:dateString,[dateFormatter stringFromDate:date],[NSString stringWithFormat:@"%u", arc4random()], nil];
}

@end
