//
//  JJTCard.m
//  DeckOfOneCard_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTCard.h"

@implementation JJTCard

// designated initializer
- (instancetype)initWithSuit: (NSString *)suit image: (NSString *)image {
    
    self = [super init];
    if (self) {
        _suit = suit;
        _image = image;
    }
    return self;
}

@end

@implementation JJTCard (JSONConvertible)

// secondary initializer: for use with JSON
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary {
    
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];
    return [self initWithSuit:suit image:image];
}

+ (NSString *)suitKey {
    return @"suit";
}

+ (NSString *)imageKey {
    return @"image";
}

@end
