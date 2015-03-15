//
//  STTwitterTableViewController.m
//  STTweetLabelExample
//
//  Created by Sebastien Thiebaud on 3/14/15.
//  Copyright (c) 2015 Sebastien Thiebaud. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "STTwitterTableViewController.h"
#import "STTweetTableViewCell.h"
#import "STTweet.h"

static NSString *const kCellReuseIdentifier = @"tweetCell";

@interface STTwitterTableViewController ()

@property (nonatomic, strong) NSArray *tweets;

@end

@implementation STTwitterTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"STTweetLabel";

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([STTweetTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kCellReuseIdentifier];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://foxieapp.com/samples/tweets.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSMutableArray *array = [NSMutableArray new];

        for (NSDictionary *dictionary in responseObject) {
            STTweet *tweet = [STTweet new];
            tweet.content = dictionary[@"text"];
            [array addObject:tweet];
        }

        self.tweets = [array copy];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    STTweetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweetCell" forIndexPath:indexPath];
    
    STTweet *tweet = (STTweet *)self.tweets[(NSUInteger)indexPath.row];
    [cell setTweet:tweet];
    
    return cell;
}


@end
