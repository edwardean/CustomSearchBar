//
//  ViewController.m
//  CustomSearchDemo
//
//  Created by 臧其龙 on 15/9/17.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:18.0/255 green:86.0/255 blue:135.0/255 alpha:1]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [_customSearchBar setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 监听textfield内容变化

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _searchBarTrailingConstraint.constant = 40;
    _cancleButton.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
    [_customSearchBar beginSetEditingUI];
    _customSearchBar.placeholder = @"search people";
    
     [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
}

- (IBAction)handleCancelButtonClick:(id)sender
{
    _searchBarTrailingConstraint.constant = 0;
    _cancleButton.hidden = YES;
    
    
    
    [_customSearchBar resignFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
    
    [self.customSearchBar endEditingUI];
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:18.0/255 green:86.0/255 blue:135.0/255 alpha:1]];

}


@end
