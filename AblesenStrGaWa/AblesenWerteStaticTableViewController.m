//
//  AblesenWerteStaticTableViewController.m
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 17.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import "AblesenWerteStaticTableViewController.h"
#import "Werte.h"
#import "JSMToolbox.h"

@interface AblesenWerteStaticTableViewController ()

@end

@implementation AblesenWerteStaticTableViewController
@synthesize stromTextView;
@synthesize gasTextView;
@synthesize wasserTextView;
@synthesize monatTextView;
@synthesize jahrTextView;
@synthesize wert = _wert;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.wert != nil){
        self.stromTextView.text = self.wert.stromWert;
        self.gasTextView.text = self.wert.gasWert;
        self.wasserTextView.text = self.wert.wasserWert;
        self.monatTextView.text = self.wert.monatWert;
        self.jahrTextView.text = self.wert.jahrWert;
        
        if (self.wert.isInserted == true) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(WerteEingebenCancelPressed:)];
            [self.navigationController setToolbarHidden:YES animated:YES];
        }
    }
}

- (void)viewDidUnload
{
    [self setStromTextView:nil];
    [self setGasTextView:nil];
    [self setWasserTextView:nil];
    [self setMonatTextView:nil];
    [self setJahrTextView:nil];
    self.wert = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [[JSMCoreDataHelper managedObjectContext]rollback];
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)WerteEingebenDonePressed:(id)sender
{

    if (self.wert != nil) {
        self.wert.stromWert = self.stromTextView.text;
        self.wert.gasWert = self.gasTextView.text;
        self.wert.wasserWert = self.wasserTextView.text;
        self.wert.monatWert = self.monatTextView.text;
        self.wert.jahrWert = self.jahrTextView.text;

        [JSMCoreDataHelper saveManagedObjectContext:[JSMCoreDataHelper managedObjectContext]];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) WerteEingebenCancelPressed: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
