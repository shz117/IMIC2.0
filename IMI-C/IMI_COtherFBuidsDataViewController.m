//
//  IMI_COtherFBuidsDataViewController.m
//  IMI-C2.0
//
//  Created by Jeremy H. Shi on 8/8/13.
//  Copyright (c) 2013 Jeremy. All rights reserved.
//

#import "IMI_COtherFBuidsDataViewController.h"
#import "IMI_CModelController.h"
@interface IMI_COtherFBuidsDataViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *q36A;
@property (weak, nonatomic) IBOutlet UIPickerView *q36cA;
@property (strong, nonatomic) NSArray *q36Array;
@property (strong, nonatomic) NSArray *q36cArray;

@end

@implementation IMI_COtherFBuidsDataViewController
@synthesize q36A;
@synthesize q36cA;

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
    self.q36Array = [NSArray arrayWithObjects:@"No",@"Yes", nil];
    self.q36cArray = [NSArray arrayWithObjects:@"Not attractive",@"Neutral",@"Attractive", nil];
    self.q36A.delegate=self;
    self.q36A.dataSource=self;
    self.q36cA.delegate=self;
    self.q36cA.dataSource=self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == self.q36A) {
        return [self.q36Array objectAtIndex:row];
    }
    return [self.self.q36cArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.q36A){
        
        return [self.q36Array count];
    }
    return [self.q36cArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(void)setImi_cResults{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.q36A selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.q36cA selectedRowInComponent:0]], nil];
}


- (void)viewDidUnload {
    [self setQ36A:nil];
    [self setQ36cA:nil];
    [super viewDidUnload];
}
@end
