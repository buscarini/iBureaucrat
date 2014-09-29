//
//  BCSwitchField.m
//  bureaucrat
//
//  Created by Jose Manuel Sánchez Peñarroja on 16/01/14.
//  Copyright (c) 2014 com.jasperblues. All rights reserved.
//

#import "BCSwitchField.h"

#import "BCDefaultInputAccessory.h"
#import "BCSwitchCell.h"
#import "UITextView+AbstractFormCell.h"
#import "BCForm.h"
#import "UITextField+AbstractFormCell.h"

@implementation BCSwitchField

/* ====================================================================================================================================== */
#pragma mark - Override

- (BCAbstractCell*)createCellInstance;
{
    BCSwitchCell* cell = [[BCSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.label setText:self.label];
    [cell.label setFrame:CGRectMake(cell.label.frame.origin.x, cell.label.frame.origin.y, 100, cell.label.frame.size.height)];
    cell.textField.returnKeyType = UIReturnKeyDefault;
	
    cell.label.textColor = [UIColor redColor];
	
    if(self.label == nil){
		cell.labelHidden = YES;
    }
    return cell;
}

- (NSString*)textValue
{
//#warning Implement this!
    return self.cell.textField.text;
}

- (void)setValue:(BOOL)value
{
    [super setValue:@(value)];
	BCSwitchCell *switchCell = (BCSwitchCell *)self.cell;
	switchCell.switchControl.on = value;
}

- (void)setInputAccessoryView:(BCDefaultInputAccessory*)inputAccessoryView
{
    self.cell.textField.inputAccessoryView = inputAccessoryView;
}

- (void)formCellWasFocused:(BCAbstractCell*)cell
{
    [super formCellWasFocused:cell];
}


@end
