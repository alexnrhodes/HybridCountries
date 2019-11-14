//
//  ARCountry.h
//  Countries
//
//  Created by Alex Rhodes on 11/14/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ARCountry : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSString *capital;
@property NSNumber *population;



- (instancetype) initWithName:(NSString *)name capital:(NSString *)capital population: (NSNumber *)population;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end

