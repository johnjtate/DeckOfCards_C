//
//  JJTCard.h
//  DeckOfOneCard_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJTCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype)initWithSuit: (NSString *)suit image: (NSString *)image;

@end

@interface JJTCard (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
