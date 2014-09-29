//
//  BCDatePickerCell.h
//  bureaucrat
//
//  Created by Jose Manuel Sánchez Peñarroja on 24/01/14.
//  Copyright (c) 2014 com.jasperblues. All rights reserved.
//

#import "BCAbstractCell.h"

@interface BCDatePickerCell : BCAbstractCell {
	
	UITextField *_textField;
	UILabel *_readOnlyField;
}

@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic) BOOL editable;


@end
