//
//  ViewController.m
//  Szybki Napiwek
//
//  Created by Michał Żółtko on 06.05.2015.
//  Copyright (c) 2015 Michał Żółtko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)A_obliczNapiwek:(id)sender {
    
    // Ukrycie klawiatury po naciśnięciu przycisku Oblicz napiwek
    [self.view endEditing:YES];
    
    float kwotaRachunku, procentNapiwku, kwotaNapiwku, rachunekKoncowy;
    
    kwotaRachunku = [self.Tf_rachunek.text floatValue];
    procentNapiwku = [self.Tf_napiwek.text floatValue];
    
    if (procentNapiwku == 0) {
        [[[UIAlertView alloc] initWithTitle:@"Uwaga!!!"
                                    message:@"Skąpiec na horyzoncie! :)"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    
    kwotaNapiwku = kwotaRachunku * (procentNapiwku / 100);
    rachunekKoncowy = kwotaRachunku + kwotaNapiwku;
    
    self.La_napiwek.text = [NSString stringWithFormat:@"%0.2f zł", kwotaNapiwku];
    self.La_rachunek.text = [NSString stringWithFormat:@"%0.2f zł", rachunekKoncowy];
}
@end
