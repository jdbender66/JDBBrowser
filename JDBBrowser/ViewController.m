//
//  ViewController.m
//  JDBBrowser
//
//  Created by Joseph Bender on 2/19/15.
//  Copyright (c) 2015 Joseph Bender. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    NSString *newData = [NSString stringWithUTF8String:[data bytes]];
    
    [_responseString appendString:newData];
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    UIAlertView *uiAlert = [[UIAlertView alloc] initWithTitle:@"Done!" message:@"Data is here!" delegate: self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [uiAlert show];
    
    [_urlContent setText:_responseString];
    
}


- (IBAction)loadURL:(id)sender
{
    [_urlField resignFirstResponder];
    NSString *simpleAddr = [_urlField text];
    
    if (simpleAddr == nil || [simpleAddr isEqualToString:@""]) {
        simpleAddr = @"http://www.pitt.edu";
    }
    
    NSURL *url = [NSURL URLWithString:simpleAddr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLConnection * conn = [NSURLConnection connectionWithRequest:request delegate:self];
    
    if (conn!=nil){
        [conn start];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _responseString = [[NSMutableString alloc] initWithCapacity: 0];
        
}

@end
