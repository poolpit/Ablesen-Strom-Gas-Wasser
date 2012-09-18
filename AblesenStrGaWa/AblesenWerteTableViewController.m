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
#import "AblesenWerteStaticTableViewController.h"

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%s", "anfang preparefor seq");

    if ([segue.identifier isEqualToString:@"showWert"]);
    {
        AblesenWerteStaticTableViewController *controller = segue.destinationViewController;
        controller.wert = [self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        NSLog(@"%s", "in show wert");

        return;
    }
            NSLog(@"%s", "vo rneu werte");
    if ([segue.identifier isEqualToString:@"neueWerte"]);
    {

        AblesenWerteStaticTableViewController *controller = segue.destinationViewController;
        controller.wert = [JSMCoreDataHelper insertManagedObjectOfClass:[Werte class] inManagedObjectContext:[JSMCoreDataHelper managedObjectContext]];
        NSLog(@"%s", "dsdjfdsfk");

        return;
    }

}

- (void) barButtonItemAddPressed: (id) sender
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [self performSegueWithIdentifier:@"neueWerte" sender:self];
    
}

@end
