//
//  SPViewController.m
//  SPTheme
//
//  Created by sayiwen on 08/18/2023.
//  Copyright (c) 2023 sayiwen. All rights reserved.
//

#import "SPViewController.h"
#import <SPTheme/SPTheme.h>
#import "SPColor+Exam.h"

@interface SPViewController ()

@end

@implementation SPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = SPColor.background;
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    title.text = @"ياخشىمۇ";
    title.font = SPFont.title;
    title.textColor = SPColor.primary;
    
    [self.view addSubview:title];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
