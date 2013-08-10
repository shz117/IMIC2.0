//
//  IMI-CQuestion38bDataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 11/26/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CQuestion38bDataViewController.h"
#import "IMI_CModelController.h"

@interface IMI_CQuestion38bDataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *question38bL;
@property (weak, nonatomic) IBOutlet UIPickerView *question38bA;
@property (nonatomic, retain) NSArray *question38bAnswerArray;
@property (nonatomic, strong) NSArray *q38cArray;
@property (weak, nonatomic) IBOutlet UIPickerView *q38c1A;
@property (weak, nonatomic) IBOutlet UIPickerView *q38c2A;
@property (weak, nonatomic) IBOutlet UIPickerView *q38c3A;

@end

@implementation IMI_CQuestion38bDataViewController

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
    self.question38bL.text=NSLocalizedString(@"question38bL", nil);
    self.question38bAnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"question38bAnswer0", nil),NSLocalizedString(@"question38bAnswer1", nil),NSLocalizedString(@"question38bAnswer2", nil),nil];
    BOOL isHidden =[[self.imi_cModelController.gloableData objectForKeyedSubscript:@"question38bActionIsHidden"] boolValue];
    [self.question38bL setHidden: isHidden];
    [self.question38bA setHidden:isHidden];
    self.q38cArray = [NSArray arrayWithObjects:@"NA",@"none",@"few",@"all/most", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.question38bA) {
        return [self.question38bAnswerArray objectAtIndex:row];
    }
    return [self.q38cArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.question38bA) {
        return [self.question38bAnswerArray count];
    }
    return [self.q38cArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    int q38c1V = 8;
    int q38c2V = 8;
    int q38c3V = 8;
    if ([self.q38c1A selectedRowInComponent:0]!=0) {
        q38c1V = [self.q38c1A selectedRowInComponent:0]-1;
    }
    if ([self.q38c2A selectedRowInComponent:0]!=0) {
        q38c2V = [self.q38c2A selectedRowInComponent:0]-1;
    }
    if ([self.q38c2A selectedRowInComponent:0]!=0) {
        q38c2V = [self.q38c2A selectedRowInComponent:0]-1;
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.question38bA selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", q38c1V],[NSString stringWithFormat:@"%d", q38c2V],[NSString stringWithFormat:@"%d", q38c3V], nil];
}
- (void)viewDidUnload {
    [self setQ38c1A:nil];
    [self setQ38c2A:nil];
    [self setQ38c3A:nil];
    [super viewDidUnload];
}
@end
