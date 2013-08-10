//
//  IMI_CQuestion62DataViewController.m
//  IMI-C2.0
//
//  Created by Jeremy H. Shi on 8/10/13.
//  Copyright (c) 2013 Jeremy. All rights reserved.
//

#import "IMI_CQuestion62DataViewController.h"

@interface IMI_CQuestion62DataViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *q62aA;
@property (weak, nonatomic) IBOutlet UIPickerView *q62bA;
@property (weak, nonatomic) IBOutlet UIPickerView *q62cA;
@property (nonatomic, retain) NSArray *q62aArray;
@property (nonatomic, retain) NSArray *q62bArray;
@end

@implementation IMI_CQuestion62DataViewController

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
    self.q62aArray = [NSArray arrayWithObjects:@"no",@"few pedestrians",@" some/a lot of pedestrians",@"A constant flow of pedestrians were present", nil];
    self.q62bArray = [NSArray arrayWithObjects:@"none",@"few",@"some/a lot", nil];}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.q62aA) {
        return [self.q62aArray objectAtIndex:row];
    }
    return [self.q62bArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.q62aA) {
        return [self.q62aArray count];
    }
    
    return [self.q62bArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.q62aA selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.q62bA selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.q62cA selectedRowInComponent:0]], nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setQ62aA:nil];
    [self setQ62bA:nil];
    [self setQ62cA:nil];
    [super viewDidUnload];
}
@end
