//
//  ViewController.m
//  LessonThree_V2
//
//  Created by Admin on 05.04.15.
//  Copyright (c) 2015 Mariya Beketova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray * arrayPrices;
@property(nonatomic, strong) NSArray * arrayValues;
@property(nonatomic, strong) NSMutableArray * arrayM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * stringPrices = @"123,1020,500";
    NSString * stringValues = @"Тетрадь,Телевизор,Утюг";
    self.arrayM = [[NSMutableArray alloc]init];
    
    
    self.arrayPrices = [stringPrices componentsSeparatedByString:@","];
    self.arrayValues = [stringValues componentsSeparatedByString:@","];

    
    for (int i = 0; i < self.arrayPrices.count; i++) {
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [self.arrayPrices objectAtIndex:i], @"prices",
                               [self.arrayValues objectAtIndex:i], @"values", nil];
        
        
        [self.arrayM addObject:dict];
        
    }

    NSLog(@"%@", self.arrayM);
    
    
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section; {
    
    return self.arrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"values"];
    cell.detailTextLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"prices"];
    return cell;
}



- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
