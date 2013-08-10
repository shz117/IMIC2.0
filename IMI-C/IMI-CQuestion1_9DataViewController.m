//
//  IMI-CQuestion1_9DataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/9/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CQuestion1_9DataViewController.h"

@interface IMI_CQuestion1_9DataViewController ()

@property (strong, nonatomic) IBOutlet UILabel *questions1_6Title;
@property (strong, nonatomic) IBOutlet UILabel *neighborhoodIdentificationTitle;
@property (strong, nonatomic) IBOutlet UILabel *question1Title;
@property (strong, nonatomic) IBOutlet UISwitch *question1Answer;

@end

@implementation IMI_CQuestion1_9DataViewController

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
    
    self.questions1_6Title.text=NSLocalizedString(@"questions1_6Title", nil);
    self.neighborhoodIdentificationTitle.text=NSLocalizedString(@"neighborhoodIdentificationTitle", nil);
    self.question1Title.text=NSLocalizedString(@"question1Title", nil);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setImi_cResults{
    self.dataArray = [NSArray arrayWithObjects:[self.question1Answer isOn] ? @"1" : @"0", nil];
    [super setImi_cResults];
}
@end
