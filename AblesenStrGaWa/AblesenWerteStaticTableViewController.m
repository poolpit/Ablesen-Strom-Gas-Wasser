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

@synthesize stromTextField;
@synthesize gasTextField;
@synthesize wasserTextField;
@synthesize monatTextField;
@synthesize jahrTextField;
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
        self.stromTextField.text = self.wert.stromWert;
        self.gasTextField.text = self.wert.gasWert;
        self.wasserTextField.text = self.wert.wasserWert;
        self.monatTextField.text = self.wert.monatWert;
        self.jahrTextField.text = self.wert.jahrWert;
        
        if (self.wert.isInserted == true) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(WerteEingebenCancelPressed:)];
            [self.navigationController setToolbarHidden:YES animated:YES];
        }
    }
}

- (void)viewDidUnload
{

    self.wert = nil;
    
    [self setStromTextField:nil];
    [self setGasTextField:nil];
    [self setWasserTextField:nil];
    [self setJahrTextField:nil];
    [self setMonatTextField:nil];
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
        self.wert.stromWert = self.stromTextField.text;
        self.wert.gasWert = self.gasTextField.text;
        self.wert.wasserWert = self.wasserTextField.text;
        self.wert.monatWert = self.monatTextField.text;
        self.wert.jahrWert = self.jahrTextField.text;

        [JSMCoreDataHelper saveManagedObjectContext:[JSMCoreDataHelper managedObjectContext]];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) WerteEingebenCancelPressed: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
