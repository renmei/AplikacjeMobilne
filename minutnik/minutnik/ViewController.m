//
//  ViewController.m
//  minutnik
//
//  Created by Michał Żółtko on 28.09.2015.
//  Copyright © 2015 Michał Żółtko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *LA_czas;
- (IBAction)BT_startstop:(id)sender;

@end

@implementation ViewController{
    bool start;
    NSTimeInterval czas;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Ustawienie początkowego czasu
    self.LA_czas.text = @"0:00";
    
    // Ustawienie początkowej wartości
    start = false;
}

-(void)update {
    
    
    // Jeżeli zmienna start=false czas nie powinien być aktualizowany.
    if (start == false) {
        
        return;
        
    }
    
    // Obecny czas i oblicznie czasu upłyniętego
    NSTimeInterval obecnyCzas = [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval uplynietyCzas = obecnyCzas - czas;
    
    // Wyliczanie minut
    int minuty = (int)(uplynietyCzas / 60.0);
    
    // Wyliczanie sekund
    int sekundy = (int)(uplynietyCzas = uplynietyCzas - (minuty * 60));
    
    // Aktualizacja etykiety z czasem
    self.LA_czas.text = [NSString stringWithFormat:@"%u:%02u", minuty, sekundy];
    
    // Zapętlenie aktualizacji
    [self performSelector:@selector(update) withObject:self afterDelay:0.1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BT_startstop:(id)sender {
    
    // Start minutnika
    if (start == false) {
        
        // Start
        start = true;
        
        // Pobranie obecnego czasu
        czas = [NSDate timeIntervalSinceReferenceDate];
        
        // Zmiana przycisku
        [sender setTitle:@"Stop / reset" forState:UIControlStateNormal];
        
        // Wywołanie aktualizacji
        [self update];
        
    }else {
        
        // Stop minutnika
        start = false;
        
        // Zmiana przycisku
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        
    }

}
@end
