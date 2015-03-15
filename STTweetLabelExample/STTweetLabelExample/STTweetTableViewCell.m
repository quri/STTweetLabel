//
//  STTweetTableViewCell.m
//  STTweetLabelExample
//
//  Created by Sebastien Thiebaud on 3/14/15.
//  Copyright (c) 2015 Sebastien Thiebaud. All rights reserved.
//

#import "STTweetTableViewCell.h"
#import "STTweetLabel.h"
#import "STTweet.h"

@interface STTweetTableViewCell ()

@property (nonatomic, weak) IBOutlet STTweetLabel *label;

@end

@implementation STTweetTableViewCell

- (void)awakeFromNib {

    [super awakeFromNib];

    STTweetLabel *label = [STTweetLabel tweetLabel];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:label];
    self.label = label;

    NSDictionary *views = NSDictionaryOfVariableBindings(_label);

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[_label]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-15-[_label]-10-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:views]];
}

- (void)setTweet:(STTweet *)tweet {

    self.label.text = tweet.content;
    self.label.textAlignment = NSTextAlignmentLeft;

    [self.label setDetectionBlock:^(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range) {
        
        NSArray *hotWords = @[[NSNull null], @"Handle", @"Hashtag", @"Link"];
        NSString *message = [NSString stringWithFormat:@"%@ selected at range %@:\n%@",
              hotWords[hotWord],
              NSStringFromRange(range),
              string];

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"STTweetLabel" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }];
}

@end
