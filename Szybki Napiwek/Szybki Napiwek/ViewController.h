//
//  ViewController.h
//  Szybki Napiwek
//
//  Created by Michał Żółtko on 06.05.2015.
//  Copyright (c) 2015 Michał Żółtko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *Tf_rachunek;
@property (weak, nonatomic) IBOutlet UITextField *Tf_napiwek;
@property (weak, nonatomic) IBOutlet UIButton *Bt_oblicz;
@property (weak, nonatomic) IBOutlet UILabel *La_napiwek;
@property (weak, nonatomic) IBOutlet UILabel *La_rachunek;

- (IBAction)A_obliczNapiwek:(id)sender;

@end

