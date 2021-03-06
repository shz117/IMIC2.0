//
//  IMI_CModelController.m
//  IMI-C
//
//  Created by Jiankai Dang on 9/18/12.
//  Copyright (c) 2012 Jiankai Dang. All rights reserved.
//

#import "IMI_CModelController.h"

#import "IMI_CDataViewController.h"
#import "CHCSVWriter.h"
#import "NetworkManager.h"
/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface IMI_CModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation IMI_CModelController

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        _pageData = [NSArray arrayWithObjects:@"Welcome",@"Question1_9",@"StreetCrossing",@"Question2c",@"Question4a",@"Question4c",@"Question5b",@"Q5d",@"Q6a",@"Q8",@"Question10_12",@"Q11",@"Residentialbyheight",@"Residentialbytype",@"School",@"Commercial",@"Office",@"Question13b",@"Question13d",@"Question13e",@"Question14a",@"Questioin14b",@"Question15",@"Question16",@"Conveniencestore",@"Community",@"Sidewalks",@"Question17c",@"Question17e",@"Question17f",@"Question17g",@"Electricalpoles",@"Question17gOther",@"Bicycles",@"Questioin21c",@"Question20",@"MidBlockCrossing",@"Steepness",@"Question26",@"StreetTrees",@"Buildings",@"Streetscape",@"Windows",@"OtherFBuids",@"Qustion36",@"Question38b",@"Question38d",@"Parking",@"Question39a",@"Maintenance",@"Question43",@"Freeways",@"Question49",@"Question50a",@"Architecture",@"BuildAge",@"Question53",@"Question55",@"Question62",@"Question58",@"Question1_9",@"StreetCrossing",@"Question2c",@"Question4a",@"Question4c",@"Question5b",@"Q5d",@"Q6a",@"Q8",@"Comments",@"Submit", nil ];
        self.pageDataViewController=[NSMutableArray arrayWithCapacity:[_pageData count]];
        self.gloableData=[NSMutableDictionary dictionary];
    }
    return self;
}

- (IMI_CDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    IMI_CDataViewController *dataViewController;
    if (([self.pageDataViewController count] == 0) || (index >= [self.pageDataViewController count])) {
        // Create a new view controller and pass suitable data.
        NSString * imc_cPageData = [self.pageData objectAtIndex:index];
        dataViewController = [storyboard instantiateViewControllerWithIdentifier:[[@"IMI_C" stringByAppendingString:imc_cPageData] stringByAppendingString:@"DataViewController"]];
        dataViewController.dataObject = imc_cPageData;
        dataViewController.imi_cModelController = self;
        dataViewController.index=index;
        [self.pageDataViewController setObject:dataViewController atIndexedSubscript:index];
        return dataViewController;
    }
    dataViewController=[self.pageDataViewController objectAtIndex:index];
    [dataViewController viewDidLoad];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(IMI_CDataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return viewController.index;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(IMI_CDataViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(IMI_CDataViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

-(void)submitResults {
    NSMutableArray *controllers = self.pageDataViewController;
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:[controllers count]];
    for (IMI_CDataViewController *controller in controllers) {
        NSLog(@"The controller: %@",controller);
        NSLog(@"data array: %@", controller.dataArray);
        [results addObjectsFromArray:controller.dataArray];
    }
    
    [[[CHCSVWriter alloc] initWithCSVFile:[[NetworkManager sharedInstance] resultsFilePath] atomic:NO] writeLineWithFields:results];
}
+(void)initResultsFile{
    /*
    [[NSFileManager defaultManager] removeItemAtPath:[[[NetworkManager sharedInstance] resultsDir] path] error:nil];
    return;
     */
    NetworkManager * manager=[NetworkManager sharedInstance];
    if ([manager isResultsDirExisted]) {
        return;
    }
    int capacity=230;
    NSMutableArray * questionNumbers=[NSMutableArray arrayWithCapacity:capacity];
    for (int i = 1; i < capacity; i++) {
        [questionNumbers addObject:[NSString stringWithFormat:@"%u", i]];
    }
    NSMutableArray * titleRow=(NSMutableArray *)[NSMutableArray arrayWithObjects:@"Date", @"Time",@"ID",@"Monument",@"Crosswalk",@"WhitLine",@"ColrLine",@"ZebraStp",@"DiffRdSf", @"CmOther",@"CrssCnvt",@"MarkSfCn",@"Curbcuts",@"CurbCLoc",@"CurbCond",@"TraffSig", @"StopSign",@"YieldSgn",@"PedActSgn",@"PedAuto",@"PedCntDwn",@"PedSound",@"PedCrosSgn",@"TraffAsst",@"PdUnOvPs", @"TrfPdSfConv",@"PdPassConv",@"PdPassMaint",@"CrssTime",@"CarsLeft",@"TurnRadii",@"Safecros",@"Convcros",@"PedIsle", @"Banners",@"Streetdir",@"Pedstreet",@"Alley",@"Narrow",@"VehLanes",@"RghtLane", @"LeftLane",@"LowRise",@"MidRise",@"MHghRise",@"HghR1318",@"HghR1924",@"HghR25-40",@"SuperHR", @"SFHdtach",@"SFHatach",@"Townhome",@"CondoApt",@"MobileH",@"DormUni",@"ResOther",@"Kinder",@"PrimSchl",@"ScndSchl",@"HighSchl",@"College",@"SchOther", @"GymFitns",@"MovieTh",@"RecOher",@"ComCtLib",@"MusTheat",@"PubCivic",@"CivOther", @"Religion",@"Medicine",@"InsOther",@"SoftGood",@"HardGood",@"OthrRtail",@"Restaurant", @"FastFood",@"SmlGrcer",@"MLGrcer",@"Financl",@"HotelHos",@"Cardeal",@"GasServ",@"BikeRetl",@"LocalStre",@"ChainStre", @"CommOthr",@"Offices",@"Service",@"OfSerOth",@"LghtInd",@"MdHvInd", @"IndsOthr",@"HarMarin",@"UndevLnd",@"AgricLnd",@"Nature",@"UndrCnstr",@"Other", @"VerMixUs",@"MUGRetail",@"MUGOff",@"MUGRest",@"MUGServ",@"MUGOther",@"MUURet",@"MUUOff",@"MUUComm",@"MUUSer",@"MUURes",@"MUUOther",@"PreUse",@"BigBox",@"ShopMall", @"StrpMall",@"RowShop",@"DrivThru",@"VacntComm",@"ParkPlay",@"PlaySprt",@"PlazaSq",@"PubGardn", @"Beach",@"PbSpOthr",@"AccessPb",@"PubSSze",@"BarsClub",@"AdultUse",@"ChckCash", @"LiquorSt",@"Restarnt",@"CoffShop",@"LibBkStr",@"CornerSt",@"ArtGllry", @"WineBar",@"FarnerMk",@"GthrOthr", @"Gated",@"GateEntr",@"GateAccs",@"Sidewalk",@"SdWkComp",@"SdwkWdth",@"SdWkCndt",@"SdWkPave",@"Arcades", @"Awnings",@"SWPtcOth",@"BuffPkCr",@"BuffLndScp",@"BuffBoll",@"BuffStTr",@"BuffFence", @"BuffOthr",@"BarrPkCr",@"BarrBike",@"BarrStVnd",@"BarrTree",@"ElecPole",@"DiningBarr",@"BarrOthr",@"MednBarr",@"OthrSdWk",@"BikeLane",@"BkLnType",@"BBrrPkCr",@"BBrrBike",@"BBrrBus",@"BBrrVeh", @"BBrrPeds",@"BBrrOthr",@"BikePkd",@"BikeRack",@"BkPrkC",@"BkPrkUC",@"BkPrkOthr",@"Bikeshre",@"Midblock",@"MbWtLn",@"MbClLn",@"MbZebra",@"MbDfRdSf",@"MbPedLght",@"MbOther",@"MbConv",@"FlatSlpe",@"ModrSlpe",@"StpSlpe",@"Dining",@"Benches",@"BusStops", @"Ledges",@"HeatLamp",@"Fountain",@"PubRestr",@"StrtTree",@"TreeSize",@"SdWkShde",@"BldhHght",@"PrmntBldgH",@"AbndBldg",@"StreetScpe",@"AvgStbck",@"WindBars",@"BlnkWall",@"BlnkMural",@"MuralAttr",@"Transp",@"Podium",@"NumBldgs",@"BldgWdthW",@"BldgWdthM",@"BldgWdthN",@"Fenestration",@"BldgEntr",@"SurfPkng",@"SizePark",@"PrctPkng", @"ParkStrc",@"Prdusprk",@"Driveway",@"MntBuild",@"MntLndScp",@"Grafitti",@"Litter",@"Dumpster",@"BrknWndw", @"Lighting",@"LghtAdeq",@"LghtAttr",@"Freeway",@"SpLmtPst",@"SpeedLim",@"SpdBump",@"RumbleSp", @"CurbBulb",@"TrafCrcl",@"Median",@"TrCmPark",@"TCOthr",@"CulDeSac",@"PedAcsPt", @"Attrtve",@"Intrstng",@"BldgAge",@"BldgClr",@"FacadeSgn",@"StVendor",@"PubArt",@"BillBrd",@"Safe",@"Walking",@"Standing",@"Sitting", @"Dogs",@"DmntSmll",@"Pollution",@"Monumnt2",@"Crosswalk2",@"WhitLine2",@"ColrLine2",@"ZebraStp2",@"DiffRdSf2", @"CmOther2",@"CrssCnvt2",@"MarkSfCn2",@"Curbcuts2",@"CurbCLoc2",@"CurbCond2",@"TraffSig2", @"StopSign2",@"YieldSgn2",@"PedActSgn2",@"PedAuto2",@"PedCntDwn2",@"PedSound2",@"PedCrosSgn2",@"TraffAsst2",@"PdUnOvPs2", @"TrfPdSfConv2",@"PdPassConv2",@"PdPassMaint2",@"CrssTime2",@"CarsLeft2",@"TurnRadii2",@"Safecros2",@"Convcros2",@"PedIsle2",@"Comments", nil];
    [[[CHCSVWriter alloc] initWithCSVFile:[manager resultsFilePath] atomic:NO] writeLineWithFields:titleRow];
}

@end
