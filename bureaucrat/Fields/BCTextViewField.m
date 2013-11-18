//
//  BCTextViewField.m
//  bureaucrat
//
//  Created by José Manuel Sánchez on 15/11/13.
//  Copyright (c) 2013 com.jasperblues. All rights reserved.
//

#import "BCTextViewField.h"

#import "BCTextViewCell.h"
#import "BCDefaultInputAccessory.h"
#import "BCFormSection.h"
#import "BCFormView.h"
#import "UITextView+AbstractFormCell.h"
#import "BCForm.h"

@implementation BCTextViewField

- (UITextView*)textView
{
	BCTextViewCell *tvCell = (BCTextViewCell *)self.cell;
    return tvCell.textView;
}


#pragma mark - Override

- (BCAbstractCell*)createCellInstance;
{
    BCTextViewCell* cell = [[BCTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.label setText:self.label];
    [cell.label setFrame:CGRectMake(cell.label.frame.origin.x, cell.label.frame.origin.y, 100, cell.label.frame.size.height)];
    cell.textView.returnKeyType = UIReturnKeyDefault;
    cell.textView.delegate = self;
    cell.textView.formCell = cell;
    cell.label.textColor = [UIColor redColor];
	
	
    if(self.label == nil){
		cell.labelHidden = YES;
    }
    return cell;
}

- (NSString*)textValue
{
    return self.textView.text;
}

- (void)setValue:(NSString*)value
{
    [super setValue:value];
    self.textView.text = value;
}

- (void)setInputAccessoryView:(BCDefaultInputAccessory*)inputAccessoryView
{
    self.textView.inputAccessoryView = inputAccessoryView;
}

- (void)formCellWasFocused:(BCAbstractCell*)cell
{
    [super formCellWasFocused:cell];
}

/* ====================================================================================================================================== */
#pragma mark <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(UITextField*)textField
{
    [self.section.parent.view textFieldDidBeginEditing:textField];
}

- (void)textFieldDidEndEditing:(UITextField*)textField
{
    [self.section.parent.view textFieldDidEndEditing:textField];
}

#pragma mark <UITextViewDelegate>

- (void) textViewDidBeginEditing:(UITextView *)textView {
	[self.section.parent.view textFieldDidBeginEditing:self.cell.textField];
}

- (void) textViewDidEndEditing:(UITextView *)textView {
	[self.section.parent.view textFieldDidEndEditing:self.cell.textField];
}

@end
