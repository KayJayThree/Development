//
//  concentration.swift
//  Concentration
//
//  Created by admin on 8/18/18.
//  Copyright © 2018 JeuxMedia. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Card]()
    
    private var indexOfOneAndONlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices  {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
                
            }
        }
    }
    
    func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "concentration.choosCard(at: chosen index not in the cards")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndONlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                //either no cards or 2 cards are face up
                indexOfOneAndONlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)):you must have at least one pair of cards")
        for identifier in 1...numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            let matchingCard = card
            cards.append(card)
            cards.append(matchingCard)
            //cards += [card, card]
        }
        
    }
    
}
