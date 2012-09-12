//
//  AblesenWerteTableViewController.m
//  Inventar
//
//  Created by Peter Wiest on 11.09.12.
//
//

#import "AblesenWerteTableViewController.h"
#import "Werte.h"
#import "Constants.h"
#import "JSMToolbox.h"

@interface AblesenWerteTableViewController ()
@property (nonatomic, strong) NSFetchedResultsController *werteFetchedResultsController;
@end

@implementation AblesenWerteTableViewController
@synthesize werteFetchedResultsController = _werteFetchedResultsController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [JSMCoreDataHelper performFetchOnFetchedResultsController: self.fetchedResultsController];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"werteCell";
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
@end
