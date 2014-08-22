//
//  DVSViewController.m
//  TrackingAndCharacterSpacing
//
//  Created by Bryan Clark on 8/21/14.
//  Copyright (c) 2014 Starbucks. All rights reserved.
//

#import "DVSViewController.h"

#import "NSAttributedString+DVSTracking.h"

@interface DVSViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *trackingLabel;
-(void)sliderChanged:(UISlider *)sender;
@end

@implementation DVSViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [UILabel new];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor colorWithRed:0.125 green:0.043 blue:0.345 alpha:1.000];
    self.label.frame = self.view.bounds;

    [self.view addSubview:self.label];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0,
                                                                 CGRectGetHeight(self.view.bounds)-100,
                                                                 CGRectGetWidth(self.view.bounds),
                                                                 100)];
    slider.tintColor = self.label.textColor;
    slider.minimumValue = 0.f;
    slider.maximumValue = 400.f;
    slider.value = 100.f;
    [slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    self.trackingLabel = [UILabel new];
    self.trackingLabel.textAlignment = NSTextAlignmentCenter;
    self.trackingLabel.textColor = self.label.textColor;
    self.trackingLabel.frame = CGRectOffset(slider.frame, 0, -CGRectGetHeight(slider.frame));
    self.trackingLabel.font = [UIFont systemFontOfSize:17.f];
    [self.view addSubview:self.trackingLabel];
    
    [self sliderChanged:slider];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sliderChanged:(UISlider *)sender
{
    self.label.attributedText = [NSAttributedString dvs_attributedStringWithString:@"DEVSIGN"
                                                                          tracking:sender.value
                                                                              font:[UIFont systemFontOfSize:17.f]];
    
    self.trackingLabel.text = [NSString stringWithFormat:@"%0.f Tracking", sender.value];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
