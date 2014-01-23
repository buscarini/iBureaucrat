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
#import "BCAbstractField.h"

@class BCTextFieldCell;


@interface BCPickerField : BCAbstractField <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    UIPickerView* _pickerView;
    BOOL _hasValue;
}

/**
* The field used to display an option value - must return an NSString. If this value is nil, 'description' will be used.
*/
@property (nonatomic) SEL displayField;

@property (nonatomic, strong) NSMutableArray *options;

- (BCTextFieldCell*)cell;

/**
* Adds an option.
*/
- (void)addOption:(id<NSObject>)option;

/**
* Adds options.
*/
- (void)addOptions:(NSMutableArray*)options;

/**
* Sets options to the contents of the supplied array (erasing any previous options).
*/
- (void)setOptions:(NSMutableArray*)options;

@end