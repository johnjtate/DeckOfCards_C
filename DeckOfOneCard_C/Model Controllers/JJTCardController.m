//
//  JJTCardController.m
//  DeckOfOneCard_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTCardController.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck";

@implementation JJTCardController

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray<JJTCard *> *cards, NSError *error))completion {
    
    // convert number of cards to draw to a string
    NSString *cardCount = [@(numberOfCards) stringValue];
    
    // 1) Construct URL/URL Request
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *newURL = [[baseURL URLByAppendingPathComponent:@"new"] URLByAppendingPathComponent:@"draw"];
    NSURLRequest *request = [NSURLRequest requestWithURL:newURL];
    
    // print the URL to the console
    NSLog([newURL absoluteString]);
    
    // 2) URLSession.shared.dataTask with completion
    [[[NSURLSession sharedSession] dataTaskWithRequest:newURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__ , error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
      
        // options is an enum; we feed in a raw value of 0 in this case
        if (data) {
            NSDictionary *jsonDictionaries = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSArray *cardsArray = jsonDictionaries[@"cards"];
            NSMutableArray *cards = [NSMutableArray array];
            for (NSDictionary *dict in cardsArray) {
                JJTCard *card = [[JJTCard alloc] initWithDictionary:dict];
                if (!card) { continue; }
                [cards addObject:card];
            }
            completion(cards, nil);
        }
      }] resume];
    
}

+ (void)fetchCardImage:(JJTCard*)card completion:(void (^) (UIImage *image, NSError *error))completion {
    
    NSURL *imageURL = [NSURL URLWithString:card.image];
    
    // print the image URL to the console
    NSLog([imageURL absoluteString]);
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__ , error, error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image, nil);
        }
    }] resume];
}

@end
