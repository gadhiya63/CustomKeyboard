//
//  CustomKeyBoard.h
//  CustomKeyBoard
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomKeyBoard : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
@property (weak, nonatomic) IBOutlet UIButton *btnSpace;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnKeyBoardArray;
@end
