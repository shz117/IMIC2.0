//
//  IMI-CQuestion43DataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/3/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CQuestion43DataViewController.h"

@interface IMI_CQuestion43DataViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *question43Answer;
@property (weak, nonatomic) IBOutlet UIPickerView *question44Answer;
@property (weak, nonatomic) IBOutlet UIPickerView *question45Answer;
@property (weak, nonatomic) IBOutlet UISwitch *question46aAnswer;
- (IBAction)question46aAction:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UILabel *question46bLabel;
@property (weak, nonatomic) IBOutlet UISwitch *question46bAnswer;
@property (weak, nonatomic) IBOutlet UILabel *question46cLabel;
@property (weak, nonatomic) IBOutlet UISwitch *question46cAnswer;
@property (weak, nonatomic) IBOutlet UIPickerView *q47A;
@property (nonatomic, retain) NSArray *question43AnswerArray;
@property (nonatomic, retain) NSArray *q47Array;
@end

@implementation IMI_CQuestion43DataViewController

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
    self.question43AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"somealotlittlenone0", nil),NSLocalizedString(@"somealotlittlenone1", nil),NSLocalizedString(@"somealotlittlenone2", nil),nil];
    self.q47Array=[NSArray arrayWithObjects:@"none",@"few",@"a lot", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ((pickerView == self.question43Answer)||(pickerView == self.question44Answer)) {
        return [self.question43AnswerArray objectAtIndex:row];
    }
    return [self.q47Array objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ((pickerView == self.question43Answer)||(pickerView == self.question44Answer)) {
        return [self.question43AnswerArray count];
    }
    return [self.q47Array count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    NSLog(@"set results");
    NSLog(@"%d",[self.question43Answer selectedRowInComponent:0]);
    NSLog(@"%d",[self.question46bAnswer isOn]);
    int question46bAnswerValue=8;
    int question46cAnswerValue=8;
    if ([self.question46aAnswer isOn]==1) {
        question46bAnswerValue=[self.question46bAnswer isOn];
        question46cAnswerValue=[self.question46cAnswer isOn];
    }
    
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.question43Answer selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.question44Answer selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.question45Answer selectedRowInComponent:0]], [NSString stringWithFormat:@"%d",[self.q47A selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.question46aAnswer isOn]],[NSString stringWithFormat:@"%d", question46bAnswerValue],[NSString stringWithFormat:@"%d", question46cAnswerValue], nil];
    NSLog(@"dataarry: %@",self.dataArray);
}

- (IBAction)question46aAction:(UISwitch *)sender {
    BOOL isHidden=![sender isOn];
    self.question46bLabel.hidden=isHidden;
    self.question46bAnswer.hidden=isHidden;
    self.question46cLabel.hidden=isHidden;
    self.question46cAnswer.hidden=isHidden;
}
- (void)viewDidUnload {
    [self setQ47A:nil];
    [super viewDidUnload];
}
@end
