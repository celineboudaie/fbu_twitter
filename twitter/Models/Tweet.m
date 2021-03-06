//
//  Tweet.m
//  twitter
//
//  Created by Celine Boudaie on 6/21/22.
//  Copyright © 2022 Emerson Malca. All rights reserved.
//

#import "Tweet.h"
#import "User.h"
#import "DateTools.h"


@implementation Tweet
    

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];

    if (self) {
        // Is this a re-tweet?
        NSDictionary *originalTweet = dictionary[@"retweeted_status"];
        if (originalTweet != nil) {
            NSDictionary *userDictionary = dictionary[@"user"];
            self.retweetedByUser = [[User alloc] initWithDictionary:userDictionary];

            // Change tweet to original tweet
            dictionary = originalTweet;
        }
        self.idStr = dictionary[@"id_str"];
        self.text = dictionary[@"text"];
        self.favoriteCount = [dictionary[@"favorite_count"] intValue];
        self.favorited = [dictionary[@"favorited"] boolValue];
        self.retweetCount = [dictionary[@"retweet_count"] intValue];
        self.retweeted = [dictionary[@"retweeted"] boolValue];

        // initialize user
        NSDictionary *user = dictionary[@"user"];
        self.user = [[User alloc] initWithDictionary:user];


        
        //created ago for date
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *dformatter = [[NSDateFormatter alloc] init];
        dformatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        NSDate *date = [dformatter dateFromString:createdAtString];
        NSString *dateString = [date shortTimeAgoSinceNow];
        
        self.createdAgo = [date shortTimeAgoSinceNow];

 
       
    }
    return self;
}

//returns Tweets when initialized with an array of Tweet dictionaries
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries {
    NSMutableArray *tweets = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        Tweet *tweet = [[Tweet alloc] initWithDictionary:dictionary];
        [tweets addObject:tweet];
    }
    return tweets;
}

@end
 
