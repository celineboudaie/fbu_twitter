//
//  ComposeViewController.m
//  twitter
//
//  Created by Celine Boudaie on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetText;


@end

@implementation ComposeViewController
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)submitTweet:(id)sender {
    [[APIManager shared] postStatusWithText:self.tweetText.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            NSLog(@"Compose Tweet Success!");
            [self dismissViewControllerAnimated:true completion:nil];
        }
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
