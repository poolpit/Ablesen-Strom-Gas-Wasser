//
//  VerbrauchWerteTableViewController.m
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 20.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//
#import "VerbrauchWerteTableViewController.h"
#import "Werte.h"
#import "Constants.h"
#import "JSMToolbox.h"
//#import "AblesenWerteStaticTableViewController.h"

@interface VerbrauchWerteTableViewController ()
@property (nonatomic, strong) NSFetchedResultsController *werteFetchedResultsController;
@end

@implementation VerbrauchWerteTableViewController
@synthesize werteFetchedResultsController = _werteFetchedResultsController;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [JSMCoreDataHelper performFetchOnFetchedResultsController: self.fetchedResultsController];
    NSLog(@"%s", "In vewdidload");
    //[self.navigationItem setRightBarButtonItems:nil animated:YES];

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"verbrauchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Werte *wert = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Configure the cell...
    //    cell.textLabel.text = wert.monatWert;
    //    cell.detailTextLabel.text = wert.jahrWert;
    cell.textLabel.text = [NSString stringWithFormat:@"Monat: %@, Jahr: %@, ", wert.monatWert, wert.jahrWert];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Strom: %@, Gas: %@, Wasser: %@", wert.stromWert, wert.gasWert, wert.wasserWert];
    
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@, %@", info.city, info.state];
    return cell;
}

#pragma mark - must be overloaded methods
- (NSFetchedResultsController *)fetchedResultsController
{
    if (self.werteFetchedResultsController != nil) {
        return self.werteFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:cEntityWerte inManagedObjectContext:[JSMCoreDataHelper managedObjectContext]];
    
    fetchRequest.entity = entityDescription;
    fetchRequest.fetchBatchSize = 64;
    
    NSSortDescriptor *sortMonatWert = [[NSSortDescriptor alloc] initWithKey:cEntityWerteAttributeMonatWert ascending:YES];
    
    NSArray *sortArray = [NSArray arrayWithObject:sortMonatWert];
    fetchRequest.sortDescriptors = sortArray;
    
    self.werteFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[JSMCoreDataHelper managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
    
    self.werteFetchedResultsController.delegate = self;
    
    return self.werteFetchedResultsController;
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"zeigeWerte"]) {
        AblesenWerteStaticTableViewController *controller = segue.destinationViewController;
        controller.wert = [self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        return;
    }
    if ([segue.identifier isEqualToString:@"neueWerte"]) {
        AblesenWerteStaticTableViewController *controller = segue.destinationViewController;
        controller.wert = [JSMCoreDataHelper insertManagedObjectOfClass:[Werte class] inManagedObjectContext:[JSMCoreDataHelper managedObjectContext]];
        return;
    }
}


- (void) barButtonItemAddPressed: (id) sender
{
    //NSLog(@"%s", "In AblesenWerte barButtonItemAddPressed");
    [self performSegueWithIdentifier:@"neueWerte" sender:self];
    
}
*/
@end
