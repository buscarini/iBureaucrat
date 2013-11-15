//
//  UITextView+AbstractFormCell.m
//  bureaucrat
//
//  Created by José Manuel Sánchez on 15/11/13.
//  Copyright (c) 2013 com.jasperblues. All rights reserved.
//

#import "UITextView+AbstractFormCell.h"
#import <objc/runtime.h>
#import "BCAbstractCell.h"

static char const* const formCellKey;

@implementation UITextView (AbstractFormCell)

- (BCAbstractCell*)formCell
{
    return objc_getAssociatedObject(self, &formCellKey);
}


- (void)setFormCell:(BCAbstractCell*)formCell
{
    objc_setAssociatedObject(self, &formCellKey, formCell, OBJC_ASSOCIATION_ASSIGN);
}

@end
