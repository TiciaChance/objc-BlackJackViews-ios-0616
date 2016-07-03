//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Flatiron School on 6/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"


@implementation FISBlackjackGame

-(instancetype)init {
    
    self = [super init];
    if (self) {
        
        // a default instance of FISCardDeck and so on...
        _deck = [[FISCardDeck alloc]init];
        _house = [[FISBlackjackPlayer alloc] initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc] initWithName:@"Player"];
        
    }
    return self;
}

//NO TEST FOR THIS METHOD ---> IT'S A HELPER METHOD
-(void) playBlackjack {
    //    should give the player's hand a card from the deck
    //should use FISCardDeck's drawNextCard method to get the next card from the deck
    
    [self.deck drawNextCard];
    
    //and use FISBlackjackPlayer's acceptCard: method to pass the card to the respective player
    for(FISCard *card in self.player.cardsInHand) {
        [self.player acceptCard: card];
    }
    
}

//ANOTHER HELPER METHOD
-(void) dealNewRound {
    
    //    This is the first deal of a new game which provides two cards to each player. Remember that cards should be dealt one at a time to all players in a round.
    
    for(NSUInteger i = 0; i < 2; i++) {
        FISCard *dealtCard = [self.deck drawNextCard];
        [self.player acceptCard: dealtCard];
    }
   
    for(NSUInteger i = 0; i < 2; i++) {
        FISCard *dealtCard = [self.deck drawNextCard];
        [self.house acceptCard:dealtCard];

    }

}

-(void) dealCardToPlayer {
    FISCard *card = [self.deck drawNextCard];
    [self.player acceptCard:card];
}
-(void) dealCardToHouse {
    FISCard *card = [self.deck drawNextCard];
    [self.house acceptCard:card];
}


-(void) processPlayerTurn {
    //    In blackjack, a player may hit (get dealt a new card) if they have not busted nor stayed.
    
    if(self.player.busted == 0 && self.player.stayed == 0) {
        [self.player shouldHit];
    }
    
    if(self.player.busted == 0 && self.player.stayed == 0) {
        [self dealCardToPlayer];
    }
    
}

-(void) processHouseTurn {
    
    if(self.house.busted == 0 && self.house.stayed == 0) {
        [self.house shouldHit];
    }
    
    if(self.house.busted == 0 && self.house.stayed == 0) {
        [self dealCardToHouse];
    }
}

-(BOOL) houseWins {
    
    //    if(self.player.busted == 1 || self.house.handscore > self.player.handscore || self.house.handscore == self.player.handscore) {
    //        return 1;
    //    }
    
    if (self.player.handscore > self.house.handscore) {
        return 0;
    }
    
    if (self.player.busted) {
        return 1;
    }
    
    if (self.player.blackjack && self.house.blackjack){
        return 0;
    }
    
    if (self.house.busted) {
            return 0;
        }
        
    return 1;
    
}
-(void) incrementWinsAndLossesForHouseWins: (BOOL) houseWins {
//     If the house has won, then add one to the house's wins property and to the player's losses property.
    
    if(houseWins){
        self.house.wins++;
        self.player.losses++;
    }
    
//    However, if the house has not won, then add one to the house's losses property and to the player's wins property.
    if(!houseWins) {
        self.house.losses++;
        self.player.wins++;
    }
    
    //Add an NSLog() message for each case so you can see the result of the hand in the debug console.
}

@end
