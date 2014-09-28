//
//  KeyboardViewController.m
//  CustomKeyBoard_iOS8
//
//  Created by Admin on 16/09/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "KeyboardViewController.h"
#import "CustomKeyBoard.h"

@interface KeyboardViewController ()
@property (strong, nonatomic) CustomKeyBoard *keyBoard;

@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}
//-(CustomKeyBoard *)keyBoard{
//    if (_keyBoard) {
//        _keyBoard = [[[NSBundle mainBundle] loadNibNamed:@"CustomKeyBoard" owner:nil options:nil] firstObject];
//    }
//    return _keyBoard;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.keyBoard = [[[NSBundle mainBundle] loadNibNamed:@"CustomKeyBoard" owner:nil options:nil] firstObject];
    self.inputView = self.keyBoard;
    
    [self addActionToKeyBoard];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    
}

#pragma Mark Keyboards Action 
-(void)addActionToKeyBoard{
    
    [self.keyBoard.btnClear addTarget:self action:@selector(clearButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.keyBoard.btnDelete addTarget:self action:@selector(deletButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.keyBoard.btnSpace addTarget:self action:@selector(spaceButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIButton *keyButton in self.keyBoard.btnKeyBoardArray) {
        [keyButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    }
}


-(void)clearButtonTapped{
    [self.textDocumentProxy deleteBackward];
}

-(void)deletButtonTapped{
    [self.textDocumentProxy insertText:@"/n"];
}

-(void)spaceButtonTapped{
    [self.textDocumentProxy insertText:@" "];
}

-(void)buttonTapped:(UIButton *)button{
    [self.textDocumentProxy insertText:[button currentTitle]];
}



















@end
