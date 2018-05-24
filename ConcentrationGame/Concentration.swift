//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Celal Aslan on 2018-05-23.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneOnlyFaceUpCard : Int?
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 1...numberOfPairsOfCards {
            
            let card = Card()
            cards += [card, card]
//            cards.append(card)
//            cards.append(card)
        }
        
        //  TODO: Homework shuffle cards
    }
    func chooseCard(at index: Int) {

        if !cards[index].isMatched {
            if let matchIndex = indexOfOneOnlyFaceUpCard, matchIndex != index {
                //check cards for match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                    cards[index].isFaceUp = true
                    indexOfOneOnlyFaceUpCard = nil
            }
                    //two cards face up
                else {
                    for flipDownIndex in cards.indices {
                        cards[flipDownIndex].isFaceUp = false
                }
                    
                    cards[index].isFaceUp = true
                    indexOfOneOnlyFaceUpCard = index
            }
        }
        
        
        // just for check the app is working after a few line of code implemented
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        }
//        else {
//            cards[index].isFaceUp = true
//        }
    
  }
}
