//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by Celine Boudaie on 6/23/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TweetCell.h"


@interface TweetDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end

@implementation TweetDetailsViewController

- (void)viewDidLoad {
   
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    self.profilePic.image = nil;
    [self.profilePic setImageWithURL:url];

    self.fullName.text = self.tweet.user.name;

    NSString *screenName = [[NSString alloc] initWithFormat:@"@%@",self.tweet.user.screenName];
    self.userName.text = screenName;
    self.date.text = self.tweet.createdAgo;
    self.tweetLabel.text = self.tweet.text;
}



@end
