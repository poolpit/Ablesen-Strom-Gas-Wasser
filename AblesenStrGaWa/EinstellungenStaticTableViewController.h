//
//  EinstellungenStaticTableViewController.h
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 18.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinstellungenStaticTableViewController : UITableViewController <UITextFieldDelegate> //id<UIGestureRecognizerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *zaehlerStromTextField;
@property (weak, nonatomic) IBOutlet UITextField *zaehlerGasTextField;
@property (weak, nonatomic) IBOutlet UITextField *zaehlerWasserTextField;

@property (weak, nonatomic) IBOutlet UITextField *preisStromTextField;
@property (weak, nonatomic) IBOutlet UITextField *preisGasTextField;
@property (weak, nonatomic) IBOutlet UITextField *preisWasserTextField;
//- (IBAction)tabView:(id)sender;

- (IBAction)saveEinstellungenPressed:(id)sender;
@end

