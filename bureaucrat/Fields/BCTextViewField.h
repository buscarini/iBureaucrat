//
//  BCTextViewField.h
//  bureaucrat
//
//  Created by José Manuel Sánchez on 15/11/13.
//  Copyright (c) 2013 com.jasperblues. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BCAbstractField.h"

@class BCTextViewCell;
@class BCFormSection;

@interface BCTextViewField : BCAbstractField <UITextViewDelegate,UITextFieldDelegate>

@property(nonatomic, weak, readonly) UITextView* textView;

- (void)setValue:(NSString*)value;

@end
