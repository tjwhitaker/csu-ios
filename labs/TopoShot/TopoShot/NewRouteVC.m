//
//  NewRouteVC.m
//  TopoShot
//
//  Created by Tim Whitaker on 3/29/13.
//  Copyright (c) 2013 CSU Chico. All rights reserved.
//

#import "NewRouteVC.h"
#import "TopoEditVC.h"

@interface NewRouteVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation NewRouteVC

- (void) viewDidLoad
{
    self.useImageButton.backgroundColor = [UIColor whiteColor];
}

- (IBAction)pickImage:(UIBarButtonItem *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    switch (sender.tag)
    {
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            break;
        case 2:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)useImage:(UIButton *)sender
{

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TopoEditVC *vc = segue.destinationViewController;
    vc.routeImage = self.routeImageView.image;
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.useImageButton.hidden = NO;
    self.routeImageView.image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end