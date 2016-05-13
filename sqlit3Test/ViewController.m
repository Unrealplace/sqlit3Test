//
//  ViewController.m
//  sqlit3Test
//
//  Created by LiYang on 16/5/13.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "ViewController.h"
#import "DataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * btn=[[UIButton alloc]init];
    btn.backgroundColor=[UIColor redColor];
    
    
    
    
    
}
- (IBAction)open:(id)sender {
    [[DataManager shared] openDataBase];
    
}
- (IBAction)create:(id)sender {
    [[DataManager shared] createTable];
}

- (IBAction)add:(id)sender {
    [[DataManager shared] insertDataWith:@"liyang" andInt:24];
    
}
- (IBAction)update:(id)sender {
    [[DataManager shared] updateDataWith:@"yang" andInt:24];
    
}
- (IBAction)select:(id)sender {
    [[DataManager shared] select];
    
}
- (IBAction)delete:(id)sender {
    [[DataManager shared] deleteDataWith:@"yang"];
}
- (IBAction)close:(id)sender {
    
    [[DataManager shared] closeDataBase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
