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
@property (weak, nonatomic) IBOutlet UILabel *toUSD;
@property (weak, nonatomic) IBOutlet UILabel *toEURO;
@property (weak, nonatomic) IBOutlet UILabel *toJPY;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

@end

@implementation ViewController
t
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
    self.toUSD.text = @"Success";
}

@end
