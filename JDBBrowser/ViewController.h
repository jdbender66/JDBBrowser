//
//  ViewController.h
//  JDBBrowser
//
//  Created by Joseph Bender on 2/19/15.
//  Copyright (c) 2015 Joseph Bender. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic, weak) IBOutlet UITextField *urlField;
@property (nonatomic, weak) IBOutlet UITextView *urlContent;
@property (nonatomic, weak) IBOutlet UIButton *goButton;

@property (nonatomic, strong) NSMutableString *responseString;

- (IBAction)loadURL:(id)sender;



@end

