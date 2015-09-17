//
//  CustomSearchBar.h
//  CustomSearchDemo
//
//  Created by 臧其龙 on 15/9/17.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSearchBar : UITextField

- (void)setupUI;

- (void)beginSetEditingUI;

- (void)endEditingUI;

- (void)setPlaceholderAttribute:(NSString *)placeHolder;

@end
