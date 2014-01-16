//
//  BCSwitchCell.h
//  bureaucrat
//
//  Created by Jose Manuel Sánchez Peñarroja on 16/01/14.
//  Copyright (c) 2014 com.jasperblues. All rights reserved.
//

#import "BCAbstractCell.h"

@interface BCSwitchCell : BCAbstractCell {
	UILabel *_readOnlyField;
}

@property (nonatomic, strong, readonly) UITextField *textField;
@property (nonatomic,strong, readonly) UISwitch *switchControl;
@property (nonatomic) BOOL editable;


@end
