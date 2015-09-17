//
//  ViewController.h
//  CustomSearchDemo
//
//  Created by 臧其龙 on 15/9/17.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSearchBar.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet CustomSearchBar *customSearchBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchBarTrailingConstraint;
@property (weak, nonatomic) IBOutlet UIButton *cancleButton;


@end

