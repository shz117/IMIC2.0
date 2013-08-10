//
//  IMI-CQuestion53DataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/4/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CQuestion53DataViewController.h"

@interface IMI_CQuestion53DataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *OtherFeaturesoftheSegmentLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *q57A;
@property (weak, nonatomic) IBOutlet UIPickerView *questioin54Answer;
@property (nonatomic, retain) NSArray *q57Array;
@property (nonatomic, retain) NSArray *question54AnswerArray;
@end

@implementation IMI_CQuestion53DataViewController

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
    
    self.OtherFeaturesoftheSegmentLabel.text=NSLocalizedString(@"OtherFeaturesoftheSegmentLabel", nil);
    self.question54AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"somealotfewnoneNA0", nil),NSLocalizedString(@"somealotfewnoneNA1", nil),NSLocalizedString(@"somealotfewnoneNA2", nil),nil];
    self.q57Array = [NSArray arrayWithObjects:@"NA",@"most/all facades/signage is uniform/uninteresting",@" most/all facades/signage is unique/interesting", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if (pickerView == self.q57A) {
        return [self.q57Array objectAtIndex:row];
    }
    return [self.question54AnswerArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.q57A) {
        return [self.q57Array count];
    }
    return [self.question54AnswerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    int q57V = 8;
    if ([self.q57A selectedRowInComponent:0]!=0) {
        q57V = [self.q57A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",q57V],[NSString stringWithFormat:@"%d", [self.questioin54Answer selectedRowInComponent:0]], nil];
}

- (void)viewDidUnload {
    [self setQ57A:nil];
    [super viewDidUnload];
}
@end
