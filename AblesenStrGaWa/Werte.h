//
//  Werte.h
//  AblesenStrGaWa
//
//  Created by Peter Wiest on 12.09.12.
//  Copyright (c) 2012 Peter Wiest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Werte;
@interface Werte : NSManagedObject

@property (nonatomic, retain) NSString * gasWert;
@property (nonatomic, retain) NSString * jahrWert;
@property (nonatomic, retain) NSString * monatWert;
@property (nonatomic, retain) NSString * stromWert;
@property (nonatomic, retain) NSString * wasserWert;

@end
