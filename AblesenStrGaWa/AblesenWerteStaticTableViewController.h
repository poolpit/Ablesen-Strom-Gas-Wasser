//
//  AblesenWerteStaticTableViewController.h
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 17.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Werte;

@interface AblesenWerteStaticTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextView *stromTextView;
@property (weak, nonatomic) IBOutlet UITextView *gasTextView;
@property (weak, nonatomic) IBOutlet UITextView *wasserTextView;
@property (weak, nonatomic) IBOutlet UITextView *monatTextView;
@property (weak, nonatomic) IBOutlet UITextView *jahrTextView;
@property (nonatomic, strong) Werte *wert;

- (IBAction)WerteEingebenDonePressed:(id)sender;

@end
