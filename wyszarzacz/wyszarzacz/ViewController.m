//
//  ViewController.m
//  wyszarzacz
//
//  Created by Michał Żółtko on 28.09.2015.
//  Copyright © 2015 Michał Żółtko. All rights reserved.
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

- (IBAction)BT_wczytaj:(id)sender {
    
    UIImagePickerController *wybor = [[UIImagePickerController alloc] init];
    
    wybor.delegate = self;
    wybor.allowsEditing = YES;
    wybor.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:wybor animated:YES completion:nil];
    
}

- (IBAction)BT_zapisz:(id)sender {
    //Tworzenie kontestu
    UIGraphicsBeginImageContextWithOptions(_IM_obraz.bounds.size, NO,0.0);
    
    [_IM_obraz.image drawInRect:CGRectMake(0, 0, _IM_obraz.frame.size.width, _IM_obraz.frame.size.height)];
    
    //Tworzenie nowego obrazu o takim samym rozmiarze
    UIImage *SaveImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //Zakonczenie kontekstu
    UIGraphicsEndImageContext();
    
    //Zapisanie obrazu do biblioteki
    UIImageWriteToSavedPhotosAlbum(SaveImage, self,@selector(image:didFinishSavingWithError:contextInfo:), nil);

}

- (IBAction)BT_wyszarz:(id)sender {
    //Stwórz CIImage z Image View
    CIImage *beginImage = [CIImage imageWithData: UIImagePNGRepresentation(self.IM_obraz.image)];
    
    //Tworzenie obiektu CIContext
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //Definicja filtru
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
    
    //Zastosowanie filtru do CIImage.
    CIImage *outputImage = [filter outputImage];
    
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    //Podmiana obrazu do Image View.
    self.IM_obraz.image = [UIImage imageWithCGImage:cgimg];
    
    //Zwolnienie CGImage.
    CGImageRelease(cgimg);

}

- (void)image:(UIImage *)obraz didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Czy był błąd?
    if (error != NULL) {
        //Alert mówiący o błędzie
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Błąd" message:@"Obraz nie mógł zostać zapisany!"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Zamknij", nil];
        
        [alert show];
        
    } else {
        //Alert mówiący o zapisaniu zdjęcia
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Zapisano" message:@"Obraz został zapisany do albumu"  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Zamknij", nil];
        
        [alert show];
    }
}

#pragma Delegacja wyboru obrazu
- (void)imagePickerController:(UIImagePickerController *)wybor didFinishPickingImage:(UIImage *)obraz editingInfo:(NSDictionary *)editingInfo {
    
    self.IM_obraz.image = obraz;
    
    [wybor dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
