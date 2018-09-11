//
//  JJTCardController.h
//  DeckOfOneCard_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTCard.h"
#import <UIKit/UIKit.h>

@interface JJTCardController : NSObject

+ (void)drawNewCard:(NSInteger)numberOfCards completion:(void (^) (NSArray<JJTCard *> *cards, NSError *error))completion;

+ (void)fetchCardImage:(JJTCard*)card completion:(void (^) (UIImage *image, NSError *error))completion;

@end
