//
//  FISBlackjackViewController.m
//  objc-BlackJackViews
//
//  Created by Flatiron School on 6/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//


//GOAL
//Connect existing data models to a view controller in order to display them.
//Use UILabels to present information about the current state of your program to your user.
//Use UIButtons to incorporate user interaction into your logical structure.
//Employ the hidden and enabled view properties.


#import "FISBlackjackViewController.h"

@interface FISBlackjackViewController ()


@end

@implementation FISBlackjackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initializes the game property
    self.game = [[FISBlackjackGame alloc]init];
    
    self.winnerLabel.hidden = 1;
    
    //hides players cards
    self.playerCard1.hidden = 1;
    self.playerCard2.hidden = 1;
    self.playerCard3.hidden = 1;
    self.playerCard4.hidden = 1;
    self.playerCard5.hidden = 1;
    
    //hides players cards
    self.houseCard1.hidden = 1;
    self.houseCard2.hidden = 1;
    self.houseCard3.hidden = 1;
    self.houseCard4.hidden = 1;
    self.houseCard5.hidden = 1;
    
    //player - stay,bust,blackjack
    
    self.playerBusted.hidden = 1;
    self.playerStayed.hidden = 1;
    self.playerBlackjack.hidden = 1;
    
    //house - stay,bust,blackjack
    
    self.houseBusted.hidden = 1;
    self.houseStayed.hidden = 1;
    self.houseBlackjack.hidden = 1;
    
    //house score
    self.houseScore.hidden = 1;
    
    
}

- (IBAction)dealButtonTapped:(id)sender {
    //[self.game.deck resetDeck];
    [self.game.house resetForNewGame];
    [self.game.player resetForNewGame];
    [self.game dealNewRound];
    
    [self.game.deck drawNextCard];
    
    self.dealButton.enabled = 0;
    self.houseScore.hidden = 1;
    
    self.houseCard1.text = @"";
    
    self.playerCard3.hidden = 1;
    self.playerCard4.hidden = 1;
    self.playerCard5.hidden = 1;
    self.houseCard3.hidden = 1;
    self.houseCard4.hidden = 1;
    self.houseCard5.hidden = 1;
    
    self.winnerLabel.hidden = 1;
    
    self.houseStayed.hidden = 1;
    self.playerStayed.hidden = 1;
    
    self.playersStayButton.enabled = 0;
    self.playersHitButton.enabled = 0;
    
    self.playerBusted.hidden = 1;
    self.houseBusted.hidden = 1;
    self.playerBlackjack.hidden = 1;
    self.houseBlackjack.hidden = 1;
    
    self.playerCard1.hidden = 0;
    
    self.playerCard1.text = ((FISCard *) self.game.player.cardsInHand[0]).cardLabel;
    
    self.playerCard2.hidden = 0;
    
    self.playerCard2.text = ((FISCard *) self.game.player.cardsInHand[1]).cardLabel;
    
    self.playerScore.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
    
    self.houseCard1.hidden = 0;
    
    self.houseCard2.hidden = 0;
    
    self.houseCard2.text = ((FISCard *)self.game.house.cardsInHand[1]).cardLabel;
    
    self.houseScore.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];
    
    if (self.game.player.blackjack == YES) {
        
        self.playerWins.hidden = 0;
        self.playerBlackjack.hidden = 0;
        self.winnerLabel.hidden = 0;
        self.winnerLabel.text = @"You Win!";
        
        [self.game incrementWinsAndLossesForHouseWins:(!self.houseWins)];
        
        self.playerWins.text = [NSString stringWithFormat:@"Wins: %li", self.game.player.wins];
        self.houseLosses.text = [NSString stringWithFormat:@"Losses: %li", self.game.house.losses];
        self.dealButton.enabled = 1;
        
    } else if (self.game.house.blackjack == YES) {
        
        
        self.houseBlackjack.hidden = 0;
        self.winnerLabel.hidden = 0;
        self.winnerLabel.text = @"House Wins";
        
        [self.game incrementWinsAndLossesForHouseWins:(self.houseWins)];
        
        self.houseWins.text = [NSString stringWithFormat:@"Wins: %li", self.game.player.wins];
        
        self.playerlosses.text = [NSString stringWithFormat:@"Losses: %li", self.game.player.losses];
        
        self.houseScore.hidden = 1;
        self.dealButton.enabled = 0;
        
    } else {
        self.playersHitButton.enabled = 1;
        self.playersStayButton.enabled = 1;                   }
    
}

- (IBAction)hitButtonTapped:(id)sender {
    
    [self.game dealCardToPlayer];
    
    if (self.game.player.cardsInHand.count == 3) {
        
        self.playerCard3.hidden = 0;
        self.playerCard3.text = ((FISCard *)self.game.player.cardsInHand[2]).cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
        
    }
    
    if (self.game.player.cardsInHand.count == 4) {
        
        self.playerCard4.hidden = 0;
        self.playerCard4.text = ((FISCard *)self.game.player.cardsInHand[3]).cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
        
    }
    
    if (self.game.player.cardsInHand.count == 5) {
        
        self.playerCard5.hidden = 0;
        self.playerCard5.text = ((FISCard *)self.game.player.cardsInHand[4]).cardLabel;
        self.playerScore.text = [NSString stringWithFormat:@"Score: %li", self.game.player.handscore];
        
    }
    
    if (self.game.player.busted == YES) {
        
        self.houseCard1.text = ((FISCard *) self.game.house.cardsInHand[0]).cardLabel;
        
        self.playerBusted.hidden = 0;
        self.playersHitButton.enabled = 0;
        self.playersStayButton.enabled = 0;
        self.winnerLabel.hidden = 0;
        self.winnerLabel.text = @"House Wins";
        
        [self.game incrementWinsAndLossesForHouseWins:(self.houseWins)];
        
        self.houseWins.text = [NSString stringWithFormat:@"Wins: %li", self.game.house.wins];
        
        self.playerlosses.text = [NSString stringWithFormat:@"Losses: %li", self.game.player.losses];
        
        self.dealButton.enabled = 1;
        self.houseScore.hidden = 0;
        
    }
    
    
}

- (IBAction)stayButtonTapped:(id)sender {
    
    self.dealButton.hidden = 0;
    self.playerStayed.hidden = 0;
    self.playersHitButton.enabled = 0;
    self.playersStayButton.enabled = 0;
    self.houseScore.hidden = 0;
    self.houseCard1.text = ((FISCard *)self.game.house.cardsInHand[0]).cardLabel;
    
    if ([self.game.house shouldHit] && self.game.house.cardsInHand.count == 2) {
        
        [self.game dealCardToHouse];
        
        self.houseCard3.hidden = 0;
        self.houseCard3.text = ((FISCard *)self.game.house.cardsInHand[2]).cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];
        
    }
    
    if ([self.game.house shouldHit] && self.game.house.cardsInHand.count == 3) {
        
        [self.game dealCardToHouse];
        
        self.houseCard4.hidden = 0;
        self.houseCard4.text = ((FISCard *)self.game.house.cardsInHand[3]).cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];
        
    }
    
    if ([self.game.house shouldHit] && self.game.house.cardsInHand.count == 4) {
        
        [self.game dealCardToHouse];
        
        self.houseCard5.hidden = 0;
        self.houseCard5.text = ((FISCard *)self.game.house.cardsInHand[4]).cardLabel;
        self.houseScore.text = [NSString stringWithFormat:@"Score: %li", self.game.house.handscore];
        
    }
    
    if (!self.game.house.shouldHit && self.game.house.handscore > 21) {
        self.houseBusted.hidden = 0;
    } else {
        self.houseStayed.hidden = 0;
        
    }
    
    if (self.game.house.handscore > self.game.player.handscore && !self.game.house.busted) {
        self.winnerLabel.hidden = 0;
        self.winnerLabel.text = @"House Wins";
        
        [self.game incrementWinsAndLossesForHouseWins:(self.houseWins)];
        
        self.houseWins.text = [NSString stringWithFormat:@"Wins: %li", self.game.house.wins];
        
        self.playerlosses.text = [NSString stringWithFormat:@"Losses: %li", self.game.player.losses];
        self.dealButton.enabled = 1;
        
    } else {
        
        self.winnerLabel.hidden = 0;
        self.winnerLabel.text = @"You're A Winner!";
        
        [self.game incrementWinsAndLossesForHouseWins:!(self.houseWins)];
        
        self.playerWins.text = [NSString stringWithFormat:@"Wins: %li", self.game.player.wins];
        
        self.houseLosses.text = [NSString stringWithFormat:@"Losses: %li", self.game.house.losses];
        self.dealButton.enabled = 1;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
