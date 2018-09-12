//
//  CardViewController.m
//  DeckOfOneCard_C
//
//  Created by John Tate on 9/11/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "CardViewController.h"

@interface CardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *suitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cardImageView;

- (IBAction)drawButtonTapped:(UIButton *)sender;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

-(void)updateViews {
   
    [JJTCardController drawNewCard:1 completion:^(NSArray<JJTCard *> *cards, NSError *error) {
        JJTCard *card = [cards objectAtIndex:0];
        dispatch_async(dispatch_get_main_queue(), ^{ self.suitLabel.text = card.suit; });
        
        [JJTCardController fetchCardImage:card completion:^(UIImage *image, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{ self.cardImageView.image = image; });
        }];
    }];
}

- (IBAction)drawButtonTapped:(UIButton *)sender {
    [self updateViews];
}

@end
