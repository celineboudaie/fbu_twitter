//
//  TweetCell.m
//  twitter
//
//  Created by Celine Boudaie on 6/22/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "APIManager.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setTweetObject:(Tweet *)tweet{
    self.tweet = tweet;
    [self refreshData];
}


-(void) refreshData{
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    self.profilePic.image = nil;
    [self.profilePic setImageWithURL:url];

    self.fullName.text = self.tweet.user.name;

    NSString *screenName = [[NSString alloc] initWithFormat:@"@%@",self.tweet.user.screenName];
    self.userName.text = screenName;
    self.date.text = self.tweet.createdAgo;
    self.tweetLabel.text = self.tweet.text;
    
    NSString* retweetString = [[NSString alloc] initWithFormat:@"%d", _tweet.retweetCount];
    NSString* likeString = [[NSString alloc] initWithFormat:@"%d", _tweet.favoriteCount];
    
    [self.retweet setTitle:retweetString forState:UIControlStateNormal];
    [self.like setTitle:likeString forState:UIControlStateNormal];
}

- (IBAction)retweet:(id)sender {
    if(self.tweet.retweeted == NO){
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
        self.tweetObject = self.tweet;
        [self refreshData];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [self.retweet setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
        self.tweetObject = self.tweet;
        [self refreshData];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {

        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", _tweet.text);
        }
        
        }];
    }
}



- (IBAction)like:(id)sender {
    
}





- (IBAction)didTapFavorite:(id)sender {
    if(self.tweet.favorited == NO){
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        [self.like setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
        self.tweetObject = self.tweet;
        [self refreshData];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
            }
        }];
    }
    else{
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [self.like setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
        self.tweetObject = self.tweet;
        [self refreshData];
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {

        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", _tweet.text);
        }
        
        }];
    }
    
}
   

@end


