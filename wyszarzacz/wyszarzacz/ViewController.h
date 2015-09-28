//
//  ViewController.h
//  wyszarzacz
//
//  Created by Michał Żółtko on 28.09.2015.
//  Copyright © 2015 Michał Żółtko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *IM_obraz;
- (IBAction)BT_wczytaj:(id)sender;
- (IBAction)BT_zapisz:(id)sender;
- (IBAction)BT_wyszarz:(id)sender;


@end

