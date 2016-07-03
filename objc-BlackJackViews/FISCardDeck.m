//
//  FISCardDeck.m
//  OOP-Cards-Model
//
//  Created by Flatiron School on 6/16/16.
//  Copyright © 2016 Al Tyus. All rights reserved.
//

#import "FISCardDeck.h"
#import "FISCard.h"

@implementation FISCardDeck


- (instancetype)init
{
    self = [super init];
    if (self) {
        _remainingCards = [NSMutableArray new];
        _dealtCards = [NSMutableArray new];
        [self combo];
        //NSLog(@"\n\n\n\n%lu\n\n\n\n\n",_remainingCards.count);
    

    }
    return self;
}

//COMPLETELY OVERLOOKED this method the first time: hence why i got green lights, but it wouldn't pass
/*To keep things organized, write a private method that will be used to generate the fifty-two cards in a standard deck. Think of an appropriate name based on its intended behavior. Make it a void method (it will assign directly to remainingCards) and leave its implementation empty for now. */

-(void)organizeCards {

    NSArray *cardRanks = [FISCard validRanks];
    NSArray *cardSuits = [FISCard validSuits];
    
        for (NSString *suit in cardSuits) {
            for (NSString *rank in cardRanks) {
                FISCard *card = [[FISCard alloc] initWithSuit:suit rank:rank];
                [self.remainingCards addObject:card];
            }
        }
        NSLog(@"\n\n\n\n\n Generated new cards, count: %lu", self.remainingCards.count);
    
}

-(FISCard *) drawNextCard {
    
    if(self.remainingCards.count == 0) {
        return nil;
    }
    
    FISCard *firstCard = self.remainingCards[0];
    [self.remainingCards removeObjectAtIndex:0];
    [self.dealtCards addObject:firstCard];
        
    return firstCard;
   // NSLog(@"\n\n\n\n\n\n this is the remaining cards array:%@ this is the dealt cards array:%@\n\n\n\n\n",self.remainingCards, self.dealtCards);
}

-(void) resetDeck {
    [self gatherDealtCards];
    [self shuffleRemainingCards];
    
}

-(void) gatherDealtCards {

            [self.remainingCards addObjectsFromArray:self.dealtCards];
            [self.dealtCards removeAllObjects];
}



-(void) shuffleRemainingCards {
    //pick up" the deck by making a mutableCopy of the remainingCards array
  NSMutableArray *copyOfCards = [self.remainingCards mutableCopy];
    
    // emptying the remainingCards array,
    [self.remainingCards removeAllObjects];

    
    NSUInteger totalNumberOfCards = [copyOfCards count];

    
   //begin a loop limited by the total number of cards to be shuffled (in most cases this will be fifty-two, but can you guarantee that?)
    
    for(NSUInteger i = 0; i < totalNumberOfCards; i++) {
        
// randomly draw a card out of the copied mutable array and insert it into the remainingCards array (make sure to remove it from the copied array
        
        NSUInteger cardCount = copyOfCards.count;
        NSUInteger RanIndex = arc4random_uniform((uint32_t)cardCount);//
        
       // NSLog(@"\n\n\n\n\n\n%lu\n\n\n\n", card);
        
        FISCard *pickRandomCard = copyOfCards[RanIndex];
        
        [copyOfCards removeObjectAtIndex:RanIndex];
        
        [self.remainingCards addObject: pickRandomCard];
        
    }
    
}

//PRIVATE METHOD
-(void) combo {
    
    
    NSArray *newValidRanks = [FISCard validRanks];
    NSArray *newValidSuits = [FISCard validSuits];
    
    for(NSString *rank in newValidRanks) {
        for(NSString *suit in newValidSuits) {
            FISCard *suitsAndRanks = [[FISCard alloc]initWithSuit:suit rank:rank];
            NSLog(@"%@", suitsAndRanks);
            [self.remainingCards addObject:suitsAndRanks];

        }
    }
}



- (NSString *)description {
    NSMutableString *result = [[NSMutableString alloc] init];
    
    [result appendFormat:@"FISCardDeck\ncount: %lu", self.remainingCards.count];
    
    [result appendString:@"\ncards:"];
    for (NSUInteger i = 0; i < self.remainingCards.count; i++) {
        if (i % 13 == 0) {
            [result appendString:@"\n"];
        }
        
        FISCard *card = self.remainingCards[i];
        [result appendFormat:@"  %@", card.description];
    }
    
    return result;
}

//-(NSString *)description{
//        NSMutableString *cardsRemaining = [[NSMutableString alloc]init];
//    
//        for (FISCard *card in self.remainingCards){
//        
//                [cardsRemaining appendFormat:@" %@",card.description];
//        
//            }
//    
//        NSString *deckDescription = [NSString stringWithFormat:@"count: %lu \ncards: %@",self.remainingCards.count, cardsRemaining];
//        return deckDescription;
//}
@end
