//
//  IMI-CArchitectureDataViewController.m
//  IMI-C
//
//  Created by Jiankai Dang on 10/4/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI-CArchitectureDataViewController.h"
#import "IMI_CModelController.h"
@interface IMI_CArchitectureDataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ArchitectureLabel;
@property (weak, nonatomic) IBOutlet UILabel *question51Label;
@property (weak, nonatomic) IBOutlet UIPickerView *question51Answer;
@property (nonatomic, retain) NSArray *question51AnswerArray;
@property (weak, nonatomic) IBOutlet UIPickerView *q54A;
@property (nonatomic, retain) NSArray *question53AnswerArray;
@end

@implementation IMI_CArchitectureDataViewController

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
    self.ArchitectureLabel.text=NSLocalizedString(@"ArchitectureLabel", nil);
    self.question53AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"question53Answer0", nil),NSLocalizedString(@"question53Answer1", nil),NSLocalizedString(@"question53Answer2", nil),nil];
    self.question51AnswerArray = [NSArray arrayWithObjects: NSLocalizedString(@"attractiveneutralunattractiveNA1", nil),NSLocalizedString(@"attractiveneutralunattractiveNA2", nil),NSLocalizedString(@"attractiveneutralunattractiveNA3", nil),nil];
    self.q54A.dataSource=self;
    self.q54A.delegate=self;
    self.question51Answer.dataSource=self;
    self.question51Answer.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView==self.q54A) {
        return [self.question53AnswerArray objectAtIndex:row];
    }
        return [self.question51AnswerArray objectAtIndex:row];
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==self.q54A) {
        return [self.question53AnswerArray count];
    }
    
    return [self.question51AnswerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
-(void)setImi_cResults{
    self.dataArray=[NSArray arrayWithObjects:[NSString stringWithFormat:@"%d", [self.question51Answer selectedRowInComponent:0]],[NSString stringWithFormat:@"%d", [self.q54A selectedRowInComponent:0]], nil];
}

- (void)viewDidUnload {
    [self setQ54A:nil];
    [super viewDidUnload];
}
@end
