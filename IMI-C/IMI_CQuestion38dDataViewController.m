//
//  IMI_CQuestion38dDataViewController.m
//  IMI-C2.0
//
//  Created by Jeremy H. Shi on 8/9/13.
//  Copyright (c) 2013 Jeremy. All rights reserved.
//

#import "IMI_CQuestion38dDataViewController.h"

@interface IMI_CQuestion38dDataViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *q38dA;
@property (weak, nonatomic) IBOutlet UIPickerView *q38eA;

@property (nonatomic, retain) NSArray *question38eAnswerArray;
@property (nonatomic, retain) NSArray *q38dArray;


@end

@implementation IMI_CQuestion38dDataViewController

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
    self.question38eAnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"somealotfewnoneNA0", nil),NSLocalizedString(@"somealotfewnoneNA1", nil),NSLocalizedString(@"somealotfewnoneNA2", nil),nil];
    self.q38dArray=[NSArray arrayWithObjects:@"NA",@"No",@"Yes", nil];
    
    self.q38dA.delegate=self;
    self.q38dA.dataSource=self;
    self.q38eA.delegate=self;
    self.q38eA.dataSource=self;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.q38dA) {
        return [self.q38dArray objectAtIndex:row];
    }
    return [self.question38eAnswerArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.q38dA) {
        return [self.q38dArray count];
    }
    return [self.question38eAnswerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    int q38dV = 8;
    int q38eV = 8;
    if ([self.q38dA selectedRowInComponent:0]!=0) {
        q38dV = [self.q38dA selectedRowInComponent:0]-1;
    }
    if ([self.q38eA selectedRowInComponent:0]!=0) {
        q38eV = [self.q38eA selectedRowInComponent:0]-1;
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", q38dV],[NSString stringWithFormat:@"%d", q38eV], nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setQ38dA:nil];
    [self setQ38eA:nil];
    [super viewDidUnload];
}
@end
