//
//  EinstellungenStaticTableViewController.m
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 18.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import "EinstellungenStaticTableViewController.h"

@interface EinstellungenStaticTableViewController ()

@end

@implementation EinstellungenStaticTableViewController

@synthesize zaehlerStromTextView;
@synthesize zaehlerGasTextView;
@synthesize zaehlerWasserTextView;



- (void) loadDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.zaehlerStromTextView.text = [defaults valueForKey:@"zaehlerStromTextView"];
    self.zaehlerGasTextView.text = [defaults valueForKey:@"zaehlerGasTextView"];
    self.zaehlerWasserTextView.text = [defaults valueForKey:@"zaehlerWasserTextView"];
    
    

}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadDefaults) name:NSUserDefaultsDidChangeNotification object:nil];
    
     [self loadDefaults];
}

- (void)viewDidUnload
{


    [self setZaehlerStromTextView:nil];
    [self setZaehlerGasTextView:nil];
    [self setZaehlerWasserTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    return cell;
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


- (IBAction)saveEinstellungenPressed:(id)sender
{
    [self.zaehlerStromTextView resignFirstResponder];
    [self.zaehlerGasTextView resignFirstResponder];
    [self.zaehlerWasserTextView resignFirstResponder];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.zaehlerStromTextView.text forKey:@"zaehlerStromTextView"];
    [defaults setObject:self.zaehlerGasTextView.text forKey:@"zaehlerGasTextView"];
    [defaults setObject:self.zaehlerWasserTextView.text forKey:@"zaehlerWasserTextView"];
    
    // Jetzt speichern
    [defaults synchronize];
    
}

@end
