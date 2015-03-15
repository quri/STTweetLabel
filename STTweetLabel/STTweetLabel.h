//
//  STTweetLabel.h
//  STTweetLabel
//
//  Created by Sebastien Thiebaud on 09/29/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

typedef NS_ENUM(NSInteger, STTweetHotWord) {
    STTweetHandle  = 1,
    STTweetHashtag = 2,
    STTweetLink    = 3
};

@interface STTweetLabel : UIView

@property (nonatomic, strong) NSArray *validProtocols;
@property (nonatomic, assign) BOOL    leftToRight;
@property (nonatomic, assign) BOOL    textSelectable;
@property (nonatomic, strong) UIColor *selectionColor;
@property (nonatomic, copy) void (^detectionBlock)(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range);

+ (instancetype)tweetLabel;

- (void)setText:(NSString *)text;
- (void)setTextAlignment:(NSTextAlignment)textAlignment;
- (void)setAttributes:(NSDictionary *)attributes;
- (void)setAttributes:(NSDictionary *)attributes hotWord:(STTweetHotWord)hotWord;

- (NSDictionary *)attributes;
- (NSDictionary *)attributesForHotWord:(STTweetHotWord)hotWord;

@end
