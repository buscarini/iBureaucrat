//
//  UITextView+AbstractFormCell.h
//  bureaucrat
//
//  Created by José Manuel Sánchez on 15/11/13.
//  Copyright (c) 2013 com.jasperblues. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BCAbstractCell;

@interface UITextView (AbstractFormCell)

- (BCAbstractCell*)formCell;

- (void)setFormCell:(BCAbstractCell*)formCell;


@end
