//
//  ARCountry.m
//  Countries
//
//  Created by Alex Rhodes on 11/14/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "ARCountry.h"

@implementation ARCountry

- (instancetype) initWithName:(NSString *)name capital:(NSString *)capital population:(NSNumber *)population {
    self = [super init];
    if (self) {
        _name = name;
        _capital = capital;
        _population = population;
    }
    return self;
    
    
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSString *name = dictionary[@"name"];
    NSString *capital = dictionary[@"capital"];
    NSNumber *population = dictionary[@"population"];

//    NSDictionary *currencyDictionary = [[NSDictionary alloc] init];
//    NSString *symbol = currencyDictionary[@"symbol"];
    
    return [self initWithName:name capital:capital population:population];
    

}

 
@end
