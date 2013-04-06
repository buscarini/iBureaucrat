////////////////////////////////////////////////////////////////////////////////
//
//  JASPER BLUES
//  Copyright 2013 Jasper Blues
//  All Rights Reserved.
//
//  NOTICE: Jasper Blues permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////





#import <Foundation/Foundation.h>

@class BCAbstractCell;

@protocol BCCellDelegate <NSObject>

- (void)formCellWasFocused:(BCAbstractCell*)cell;

- (void)formCellLostFocus:(BCAbstractCell*)cell;

@end