//
//  IMI-CQuestion17gOtherDataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/2/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CQuestion17gOtherDataViewController.h"
#import "IMI_CModelController.h"
@interface IMI_CQuestion17gOtherDataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *question17gOtherL;
@property (weak, nonatomic) IBOutlet UIPickerView *question17gOtherA;

@property (weak, nonatomic) IBOutlet UILabel *question18Label;
@property (weak, nonatomic) IBOutlet UISwitch *question18Answer;
@property (weak, nonatomic) IBOutlet UILabel *question19L;
@property (weak, nonatomic) IBOutlet UISwitch *question19A;
@property (nonatomic, retain) NSArray *question17gOtherAArray;
@property (nonatomic, retain) NSArray *question17hAnswerArray;
@end

@implementation IMI_CQuestion17gOtherDataViewController

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
    self.question17gOtherL.text=NSLocalizedString(@"question17gOtherL", nil);
    
   
    self.question17gOtherAArray = [NSArray arrayWithObjects: NSLocalizedString(@"question17gA0", nil),NSLocalizedString(@"question17gA1", nil),NSLocalizedString(@"question17gA2", nil),nil];
    self.question17hAnswerArray = [NSArray arrayWithObjects:NSLocalizedString(@"question17hAnswer0", nil),NSLocalizedString(@"question17hAnswer1", nil),NSLocalizedString(@"question17hAnswer2", nil),nil];
    self.question18Label.text=NSLocalizedString(@"question18Label", nil);
    self.question19L.text=NSLocalizedString(@"question19L", nil);
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.question17gOtherA) {
        return [self.question17gOtherAArray objectAtIndex:row];
    }
    return [self.question17hAnswerArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.question17gOtherA) {
        return [self.question17gOtherAArray count];
    }
	return [self.question17hAnswerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self getPickerValue:self.question17gOtherA]],[NSString stringWithFormat:@"%d", [self.question19A isOn]],[NSString stringWithFormat:@"%d", [self.question18Answer isOn]], nil];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==self.question17gOtherA) {
       
    }
}
-(NSInteger)getPickerValue:(UIPickerView *)pickerView{
    NSInteger row=[pickerView selectedRowInComponent:0];
    if (pickerView.isHidden) {
        return 8;
    } else {
        return row;
    }
}
@end
