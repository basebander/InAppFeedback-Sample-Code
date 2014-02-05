//
//  ViewController.m
//  InAppFeedback
//
//  Created by Ryan Hartman on 2/5/14.
//  Copyright (c) 2014 basebander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define alertTag 1

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPushSend:(id)sender {
    
    
    //Check to see which segment index is selected
    //on the segmentedControl and configure the strings
    //we will use in the feedback message.
    
    NSString *stringResult;
    NSString *stringPaidOrFree = @"Paid User";
    NSString *stringComments = self.textComments.text;
    NSString *stringMailAddress = self.textEmail.text;
    NSString *stringVersion = @"1.0";
    
    
    if(self.segmentedControl.selectedSegmentIndex == 0)
        stringResult = @"I love it";
    else
        stringResult = @"It needs work.";
    
    
    
    
    //Configure the NSURLConnection and POST the request to the
    //correct URL;
    
#warning Upload the feedback.php file to your own webserver and provide the URL here:
    NSURL *url = [NSURL URLWithString:@"http://www.yourdomain.com/feedback.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *requestBodyString = [NSString stringWithFormat:@"feedbackResult=%@&feedbackSender=%@&feedbackMessage=%@&feedbackIsPRO=%@&feedbackVersion=%@", stringResult,stringMailAddress, stringComments,stringPaidOrFree,stringVersion];
    
    NSData *requestBody = [requestBodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:requestBody];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    
    
    
    /* If the user has sent positive feedback, lets prompt them to leave a review in the App Store, otherwise don't bother them. This is a good way to avoid negative reviews, while still collecting feedback from the user. */
    
    if(self.segmentedControl.selectedSegmentIndex == 0){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Thanks for your feedback!\n\nWould you like to also review [APP] in the App Store?" delegate:self cancelButtonTitle:@"No, thanks" otherButtonTitles:@"Yes",nil];
        
        alert.tag = alertTag;
        [alert show];
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"The user doesn't love the app, don't ask them to rate the app.\n\nPerhaps directing them to your support page is a good idea." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
        
        [alert show];
        
    }
    
    
}


- (BOOL)textViewShouldReturn:(UITextView *)textView {
    
    [textView resignFirstResponder];
    
    return YES;
}


-(void)textViewDidBeginEditing:(UITextField *)textView {
    
    textView.returnKeyType = UIReturnKeyDone;
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == alertTag){
        
        if(buttonIndex == 1){
            
            //The user wishes to leave a review in the App Store, lets open it for them.

#warning Add the unique ID of your app (see iTunes Connect).

            NSString *appID = @"91919191919";
            NSString *appURL = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/%@/app/id%@",[[NSLocale preferredLanguages] objectAtIndex:0],appID];
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
            
        }
        
    }
    
}


@end
