//
//  ViewController.m
//  Test1
//
//  Created by jinjin on 17/9/8.
//  Copyright © 2017年 jinjin. All rights reserved.
//

#import "ViewController.h"

#import "TableViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationController.navigationBar.translucent = NO;
    
    
}
- (IBAction)push:(id)sender {
    TableViewController * tableVC = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tableVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
