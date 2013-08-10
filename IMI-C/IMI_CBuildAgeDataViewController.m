//
//  IMI_CBuildAgeDataViewController.m
//  IMI-C2.0
//
//  Created by Jeremy H. Shi on 8/9/13.
//  Copyright (c) 2013 Jeremy. All rights reserved.
//

#import "IMI_CBuildAgeDataViewController.h"

@interface IMI_CBuildAgeDataViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *q55A;
@property (weak, nonatomic) IBOutlet UIPickerView *q56A;
@property (nonatomic, retain) NSArray *q55Array;
@property (nonatomic, retain) NSArray *q56Array;


@end

@implementation IMI_CBuildAgeDataViewController

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
    self.q55Array = [NSArray arrayWithObjects:@"NA",@"newer/mordern",@"mix of older/historic and modern",@" older/historic", nil];
    self.q56Array = [NSArray arrayWithObjects:@"NA",@"buildings are mostly all one/similar color",@" buildings are variety of colors", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.q55A) {
        return [self.q55Array objectAtIndex:row];
    }
    return [self.q56Array objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.q55A) {
        return [self.q55Array count];
    }
    
    return [self.q56Array count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    int q55V = 8;
    int q56V = 8;
    if ([self.q55A selectedRowInComponent:0]!=0) {
        q55V = [self.q55A selectedRowInComponent:0];
    }
    if ([self.q56A selectedRowInComponent:0]!=0) {
        q56V = [self.q56A selectedRowInComponent:0];
    }
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d",q55V],[NSString stringWithFormat:@"%d", q56V], nil];
}


- (void)viewDidUnload {
    [self setQ55A:nil];
    [self setQ56A:nil];
    [super viewDidUnload];
}
@end
