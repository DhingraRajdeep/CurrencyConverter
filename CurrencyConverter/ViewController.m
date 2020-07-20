//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Rajdeep Singh Dhingra on 20/07/20.
//  Copyright © 2020 Rajdeep Singh Dhingra. All rights reserved.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UILabel *toEURO;
@property (weak, nonatomic) IBOutlet UILabel *toJPY;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@property (weak, nonatomic) IBOutlet UILabel *toINR;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonTap:(id)sender {
    self.convertButton.enabled=NO;
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate = self;
    [self.req start];
    
}

- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled=YES;
    double val = [self.inputField.text floatValue];
    double val1 = val*currencies.INR;
    double val2 = val*currencies.EUR;
    double val3 = val*currencies.JPY;
    NSString *temp1 = [NSString stringWithFormat:@"%.2f",val1];
    NSString *temp2 = [NSString stringWithFormat:@"%.2f",val2];
    NSString *temp3 = [NSString stringWithFormat:@"%.2f",val3];
    self.toINR.text = temp1;
    self.toJPY.text = temp3;
    self.toEURO.text = temp2;
}

@end
