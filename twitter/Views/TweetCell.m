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
    _tweetObject = tweet;
//    profile picture
    NSString *URLString = self.tweetObject.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    self.profilePic.image = nil;
    [self.profilePic setImageWithURL:url];

    self.fullName.text = self.tweetObject.user.name;

    NSString *screenName = [[NSString alloc] initWithFormat:@"@%@",self.tweetObject.user.screenName];
    self.userName.text = screenName;
    self.date.text = self.tweetObject.createdAtString;
    self.tweetLabel.text = self.tweetObject.text;
//    add button interactions: like, rt, reply, message.
//    self.reply = self.tweet
//    self.retweet
//    self.like
//    self.directMessage
}

@end


