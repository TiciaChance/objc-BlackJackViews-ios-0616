//
//  FISBlackjackPlayer.m
//  BlackJack
//
//  Created by Flatiron School on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

-(instancetype)init {
    
    self = [self initWithName:@""];
    
    return self;
}

-(instancetype) initWithName: name {
    
    _name = name;
    _cardsInHand = [[NSMutableArray alloc] init];
    _handscore = 0;
    _wins = 0;
    _losses = 0;
    _aceInHand = 0;
    _blackjack = 0;
    _busted = 0;
    _stayed = 0;
    
    return self;
}

-(void) resetForNewGame {
    //resets a player for a new game
    self.handscore = 0;
    [self.cardsInHand removeAllObjects];
    
    
    self.aceInHand = NO;
    self.stayed = NO;
    self. blackjack = NO;
    self.busted = NO;
    
}



-(void) acceptCard: (FISCard *) card {
    
    
//    
//    [self.cardsInHand addObject:card];
//    
//    
//    self.handscore+= card.cardValue;
//    
//    //NSLog(@"\n\n\n\n\nthis is the card:%@ and card value %lu:", cards.rank, card.cardValue);
//    
//    if([card isEqual:@"A"]){
//        self.aceInHand = YES;
//    }
//    //    if the total value of the cards in the hand is eleven or less, add ten points to the score.
//    
//    if(self.aceInHand && self.handscore <= 11) {
//        self.handscore +=10;
//    }
//    
//    if(self.aceInHand && self.handscore >= 11)
//        self.handscore += 1;
//    
//    [self checkBlackjackAndBusted];
    
    
    [self.cardsInHand addObject:card];
    
    NSUInteger starter = 0;
    
    for (FISCard *cards in self.cardsInHand) {
        starter += cards.cardValue;
        NSLog(@"\n\n\n\n\nthis is the card:%@ and card value %lu:", cards.rank, card.cardValue);
        
        if([cards.rank isEqualToString:@"A"]){
            self.aceInHand = YES;
        }
    }
    //if the total value of the cards in the hand is eleven or less, add ten points to the score.
    
    if(self.aceInHand && starter <= 11){
        starter += 10;
    }
    
    self.handscore = starter;
    
    [self checkBlackjackAndBusted];
    
    
}

// HELPER METHOD

-(void)checkBlackjackAndBusted {
    
    if(self.cardsInHand.count == 2 && self.handscore == 21) {
        
        self.blackjack = YES;
    }
    
    if(self.handscore > 21) {
        self.busted = 1;
    }
    
}


-(BOOL) shouldHit {
    
    //If the handscore is greater than that value (17), set the stayed property to YES and return NO, otherwise return YES.
    
    if(self.handscore > 17) {
        self.stayed = YES;
        return 0;
    }
    
    return 1;
}

-(NSString *) description {
    
   // NSMutableString *blackjackString = [[NSMutableString alloc]init];
    
  NSMutableString *blackjackString = [NSMutableString stringWithFormat:@"\n name : %@ \ncards:%@ \nhandscore: %lu \n ace in hand: %d \n stayed: %d \nblackjack: %d \nbusted: %d \nwins: %lu \nlosses: %lu", self.name, self.cardsInHand, self.handscore, self.aceInHand, self.stayed, self.blackjack, self.busted, self.wins, self.losses];
    
    NSLog(@"\n\n\n\n\n%@\n\n\n\n\n", blackjackString);
    
    return blackjackString;
}

@end
