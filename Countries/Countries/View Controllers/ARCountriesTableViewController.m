//
//  ARCountriesTableViewController.m
//  Countries
//
//  Created by Alex Rhodes on 11/14/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "ARCountriesTableViewController.h"
#import "Countries-Swift.h"
#import "ARCountry.h"

@interface ARCountriesTableViewController ()

@property CountryController *conntryController;

@end

@implementation ARCountriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.conntryController fetchCountriesWithCompletion:^(NSError * error) {
        //error handling
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _conntryController = [[CountryController alloc]init];
    }
    return self;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.conntryController.countries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryCell" forIndexPath:indexPath];
    
    ARCountry *country = self.conntryController.countries[indexPath.row];
    
    cell.textLabel.text = country.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",country.population];
    
    return cell;
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

@end
