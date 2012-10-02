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

@synthesize zaehlerStromTextField =  _zaehlerStromTextField;
@synthesize zaehlerGasTextField = _zaehlerGasTextField;
@synthesize zaehlerWasserTextField = _zaehlerWasserTextField;
@synthesize preisStromTextField = _preisStromTextField;
@synthesize preisGasTextField = _preisGasTextField;
@synthesize preisWasserTextField = _preisWasserTextField;



- (void) loadDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.zaehlerStromTextField.text = [defaults valueForKey:@"zaehlerStromTextField"];
    self.zaehlerGasTextField.text = [defaults valueForKey:@"zaehlerGasTextField"];
    self.zaehlerWasserTextField.text = [defaults valueForKey:@"zaehlerWasserTextField"];
    
    self.preisStromTextField.text = [defaults valueForKey:@"preisStromTextField"];
    self.preisGasTextField.text = [defaults valueForKey:@"preisGasTextField"];
    self.preisWasserTextField.text = [defaults valueForKey:@"preisWasserTextField"];
    

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


    [self setPreisStromTextField:nil];
    [self setPreisGasTextField:nil];
    [self setPreisWasserTextField:nil];
    [self setZaehlerStromTextField:nil];
    [self setZaehlerGasTextField:nil];
    [self setZaehlerWasserTextField:nil];
    
    [self setZaehlerStromTextField:nil];
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

/*
- (IBAction)tabView:(id)sender {
}
*/
- (IBAction)saveEinstellungenPressed:(id)sender
{
    [self.zaehlerStromTextField resignFirstResponder];
    [self.zaehlerGasTextField resignFirstResponder];
    [self.zaehlerWasserTextField resignFirstResponder];
    
    [self.preisStromTextField resignFirstResponder];
    [self.preisGasTextField resignFirstResponder];
    [self.preisWasserTextField resignFirstResponder];
   
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // Observer abmelden, damit nach dem Speichern des TextFields gleich die “alten” Defaults für
    // switch3d und slider geladen werden!
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NSUserDefaultsDidChangeNotification
                                                  object:nil];
    
    [defaults setObject:self.zaehlerStromTextField.text forKey:@"zaehlerStromTextField"];
    [defaults setObject:self.zaehlerGasTextField.text forKey:@"zaehlerGasTextField"];
    [defaults setObject:self.zaehlerWasserTextField.text forKey:@"zaehlerWasserTextField"];

    [defaults setObject:self.preisStromTextField.text forKey:@"preisStromTextField"];
    [defaults setObject:self.preisGasTextField.text forKey:@"preisGasTextField"];
    [defaults setObject:self.preisWasserTextField.text forKey:@"preisWasserTextField"];

    // Jetzt speichern
    [defaults synchronize];
    
    // Observer wieder anmelden
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadDefaults)
                                                 name:NSUserDefaultsDidChangeNotification
                                               object:nil];
    

    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"----->%@", textField.text);
    [textField resignFirstResponder];
    return YES;
}

@end
