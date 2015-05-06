//
//  ViewController.m
//  App1
//
//  Created by Michał Żółtko on 16.04.2015.
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

- (IBAction)showMessage
{
    UIAlertView *helloWorldAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Pierwsza aplikacja" message:@"Witaj świecie!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Wyświetl wiadomość
    [helloWorldAlert show];
}

@end
