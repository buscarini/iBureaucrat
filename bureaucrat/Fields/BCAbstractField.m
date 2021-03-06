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



#import "BCTextFieldCell.h"
#import "BCTextField.h"
#import "BCFormSection.h"
#import "BCForm.h"
#import "BCFormDelegate.h"


@implementation BCAbstractField

/* ====================================================================================================================================== */
#pragma mark - Class Methods

+ (id)fieldWithLabel:(NSString*)label
{
    return [[self alloc] initWithLabel:label cellColor:nil selectedCellColor:nil sectionTitleColor:nil];
}

+ (id)fieldWithLabel:(NSString*)label cellColor:(UIColor*)cellColor selectedCellColor:(UIColor*)selectedCellColor
        sectionTitleColor:(UIColor*)sectionTitleColor
{
    return [[self alloc] initWithLabel:label cellColor:cellColor selectedCellColor:selectedCellColor sectionTitleColor:sectionTitleColor];
}

/* ====================================================================================================================================== */
#pragma mark - Initialization & Destruction

- (id)initWithLabel:(NSString*)label cellColor:(UIColor*)cellColor selectedCellColor:(UIColor*)selectedCellColor
        sectionTitleColor:(UIColor*)sectionTitleColor
{
    self = [super init];
    if (self)
    {
        _label = label;
        _cellColor = cellColor;
        _selectedCellColor = selectedCellColor;
        _sectionTitleColor = sectionTitleColor;
        _editable = YES;
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/* ====================================================================================================================================== */
#pragma mark - Interface Methods

- (BCAbstractCell*)cell
{
    if (_cell == nil)
    {
        _cell = [self createCellInstance];
        [_cell setDelegate:self];
        [_cell setField:self];
    }
    return _cell;
}

- (void)setEditable:(BOOL)editable
{
    _editable = editable;
    [(BCTextField*) self.cell setEditable:_editable];
}

/* ====================================================================================================================================== */
#pragma mark - Override

- (UIColor*)cellColor
{
    return _cellColor == nil ? [_section cellColor] : _cellColor;
}

- (UIColor*)selectedCellColor
{
    return _selectedCellColor == nil ? [_section selectedCellColor] : _cellColor;
}

- (UIColor*)sectionTitleColor
{
    return _sectionTitleColor == nil ? [_section sectionTitleColor] : _sectionTitleColor;
}

- (UIColor*)textColor
{
    return _textColor == nil ? [_section textColor] : _textColor;
}

- (UIColor*)selectedTextColor
{
    if (_selectedTextColor == nil)
    {
        return [_section selectedTextColor];
    }
    else
    {
        return _selectedTextColor == nil ? [_section selectedCellColor] : _selectedTextColor;
    }
}

- (void)formCellWasFocused:(BCAbstractCell*)cell
{
    id<BCFormDelegate> delegate = self.section.parent.delegate;
    if ([delegate respondsToSelector:@selector(fieldReceivedFocus:)])
    {
        [delegate fieldReceivedFocus:self];
    }
}

- (void)formCellLostFocus:(BCAbstractCell*)cell
{
    id<BCFormDelegate> delegate = self.section.parent.delegate;
    if ([delegate respondsToSelector:@selector(fieldLostFocus:)])
    {
        [delegate fieldLostFocus:self];
    }
}

/* ====================================================================================================================================== */
#pragma mark - Abstract methods

- (BCAbstractCell*)createCellInstance
{
    return nil;
}

- (NSString*)textValue
{
    return nil;
}

- (id <NSObject>)value
{
    return _value;
}


- (void)setValue:(id<NSObject>)value
{
    _value = value;
    [self.cell layoutIfNeeded];
}


/* ====================================================================================================================================== */
#pragma mark - Utility Methods

- (NSString*)description
{
    NSMutableString* description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"_cell=%@", _cell];
    [description appendFormat:@", self.section=%@", self.section];
    [description appendFormat:@", self.label=%@", self.label];
    [description appendFormat:@", self.editable=%d", self.editable];
    [description appendString:@">"];
    return description;
}

@end