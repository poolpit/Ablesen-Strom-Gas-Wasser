//
//  EinstellungenStaticTableViewController.h
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 18.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EinstellungenStaticTableViewController : UITableViewController 

@property (weak, nonatomic) IBOutlet UITextView *zaehlerStromTextView;
@property (weak, nonatomic) IBOutlet UITextView *zaehlerGasTextView;
@property (weak, nonatomic) IBOutlet UITextView *zaehlerWasserTextView;

- (IBAction)saveEinstellungenPressed:(id)sender;
@end
