//
//  ViewController.h
//  InAppFeedback
//
//  Created by Ryan Hartman on 2/5/14.
//  Copyright (c) 2014 basebander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextView *textComments;
@property (weak, nonatomic) IBOutlet UITextView *textEmail;

- (IBAction)buttonPushSend:(id)sender;


@end
