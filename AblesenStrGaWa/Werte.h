//
//  Werte.h
//  Inventar
//
//  Created by Peter Wiest on 11.09.12.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@class Werte;

@interface Werte : NSManagedObject

@property (nonatomic, retain) NSString * monatWert;
@property (nonatomic, retain) NSString * jahrWert;

@end
