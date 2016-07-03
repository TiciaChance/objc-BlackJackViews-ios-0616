//
//  FISBlackjackViewController.h
//  objc-BlackJackViews
//
//  Created by Flatiron School on 6/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"

@interface FISBlackjackViewController : UIViewController

@property (strong, nonatomic) FISBlackjackGame *game;

@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UILabel *houseScore;
@property (weak, nonatomic) IBOutlet UILabel *playerScore;
@property (weak, nonatomic) IBOutlet UIButton *playersHitButton;
@property (weak, nonatomic) IBOutlet UIButton *playersStayButton;

//HOUSE CARDS
@property (weak, nonatomic) IBOutlet UILabel *houseMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *houseCard1;
@property (weak, nonatomic) IBOutlet UILabel *houseCard2;
@property (weak, nonatomic) IBOutlet UILabel *houseCard3;
@property (weak, nonatomic) IBOutlet UILabel *houseCard4;
@property (weak, nonatomic) IBOutlet UILabel *houseCard5;
@property (weak, nonatomic) IBOutlet UILabel *houseWins;
@property (weak, nonatomic) IBOutlet UILabel *houseLosses;

//PLAYER CARDS
@property (weak, nonatomic) IBOutlet UILabel *playerMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerCard1;
@property (weak, nonatomic) IBOutlet UILabel *playerCard2;
@property (weak, nonatomic) IBOutlet UILabel *playerCard3;
@property (weak, nonatomic) IBOutlet UILabel *playerCard4;
@property (weak, nonatomic) IBOutlet UILabel *playerCard5;
@property (weak, nonatomic) IBOutlet UILabel *playerWins;
@property (weak, nonatomic) IBOutlet UILabel *playerlosses;


//HOUSE - busted, blackjack, stayed

@property (weak, nonatomic) IBOutlet UILabel *houseStayed;
@property (weak, nonatomic) IBOutlet UILabel *houseBusted;
@property (weak, nonatomic) IBOutlet UILabel *houseBlackjack;

//PLAYER - busted, blackjack, stayed
@property (weak, nonatomic) IBOutlet UILabel *playerStayed;
@property (weak, nonatomic) IBOutlet UILabel *playerBusted;
@property (weak, nonatomic) IBOutlet UILabel *playerBlackjack;






@end
