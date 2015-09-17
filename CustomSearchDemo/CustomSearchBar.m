//
//  CustomSearchBar.m
//  CustomSearchDemo
//
//  Created by 臧其龙 on 15/9/17.
//  Copyright (c) 2015年 臧其龙. All rights reserved.
//

#import "CustomSearchBar.h"
#import <FAKFontAwesome.h>
#import <FAKIonIcons.h>

@interface CustomSearchBar ()
{
    UILabel *animateLabel;
    
    CGPoint originalCenter;
    
    UILabel *fakePlaceHolderLabel;
    
    UILabel *leftViewForSearchBar;
}
@end

@implementation CustomSearchBar


- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI
{
    if (!leftViewForSearchBar) {
        
        
        FAKFontAwesome *tmpIcon = nil;
        NSMutableAttributedString *tmpMas = nil;
        
        tmpIcon = [FAKFontAwesome searchIconWithSize:13];
        [tmpIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
        tmpMas = [[tmpIcon attributedString] mutableCopy];
        [tmpMas appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"  ", nil) attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:13]}]];
        [tmpMas appendAttributedString:[[NSAttributedString alloc] initWithString:NSLocalizedString(@"搜索", nil) attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:13.0]}]];
        
        //  FAKIonIcons *searchLeftIcon = [FAKIonIcons ios7SearchStrongIconWithSize:13];
        FAKIonIcons *searchLeftIcon = [FAKIonIcons iosSearchStrongIconWithSize:13];
        [searchLeftIcon addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
        
        leftViewForSearchBar = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 13, 13)];
        [leftViewForSearchBar setAttributedText:[[searchLeftIcon attributedString] mutableCopy]];
        leftViewForSearchBar.center = CGPointMake(CGRectGetWidth(self.bounds)/2 - 20, CGRectGetHeight(self.bounds)/2);
        originalCenter = leftViewForSearchBar.center;
        [self addSubview:leftViewForSearchBar];
        leftViewForSearchBar.alpha = 0;
        
        fakePlaceHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        [fakePlaceHolderLabel setAttributedText:tmpMas];
        [fakePlaceHolderLabel setTextAlignment:NSTextAlignmentCenter];
        fakePlaceHolderLabel.textColor = [UIColor whiteColor];
        fakePlaceHolderLabel.center = CGPointMake(CGRectGetWidth(self.bounds)/2 , CGRectGetHeight(self.bounds)/2);
        [self addSubview:fakePlaceHolderLabel];
        
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.borderStyle = UITextBorderStyleNone;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
        
        self.leftViewMode = UITextFieldViewModeAlways;
        [self setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:13.0]];
    }
    
}

- (void)beginSetEditingUI
{
    fakePlaceHolderLabel.alpha = 0;
    leftViewForSearchBar.alpha = 1;
    [UIView animateWithDuration:0.25 animations:^{
        leftViewForSearchBar.frame = CGRectMake(10, 8, 13, 13);
        
    } completion:^(BOOL finished) {
        // leftViewForSearchBar.alpha = 0;
    }];
    
    
    self.backgroundColor = [UIColor colorWithRed:237.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    [self setText:@""];
    [self setPlaceholderAttribute:@"search people"];
}

- (void)endEditingUI
{
    leftViewForSearchBar.alpha = 1;
    fakePlaceHolderLabel.alpha = 0;
    [UIView animateWithDuration:0.25 animations:^{
        leftViewForSearchBar.center = CGPointMake(100, originalCenter.y);
        
    } completion:^(BOOL finished) {
        leftViewForSearchBar.alpha = 0;
        fakePlaceHolderLabel.alpha = 1;
    }];
    
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
    [self setPlaceholderAttribute:@""];
    self.text = @"";
}

- (void)setPlaceholderAttribute:(NSString *)placeHolder
{
    UIColor *placeHolderColor  = [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1];
    
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeHolder
                                                                 attributes:@{
                                                                              NSForegroundColorAttributeName: placeHolderColor,
                                                                              NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Regular" size:13.0]
                                                                              }
                                  ];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect textRect = [super leftViewRectForBounds:bounds];
    textRect.origin.x += 10;
    return textRect;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 30 , 0 );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 30 , 0 );
}

@end
