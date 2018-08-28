//
//  ViewController.swift
//  Concentration
//
//  Created by admin on 8/16/18.
//  Copyright © 2018 JeuxMedia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
            return (cardButtons.count + 1) / 2

    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet private weak var flipCountLabel: UILabel!
    
    
    @IBOutlet var cardButtons: [UIButton]!
   
    
    @IBAction private func touchCard(_ sender: UIButton) {
        // increment Label counter when clicked
        flipCount += 1
        
        // Array for emoji's
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            //flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            Swift.print("cardNumber = \(cardNumber)")
            Swift.print("numberOfPairsOfCards is \(numberOfPairsOfCards)")
        } else {
            Swift.print("cardNumber not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                
            }
        }
    }
    
    var emojiChoices = ["🎃", "🍎", "💀", "🧙🏼‍♂️", "👺", "🌚", "💨", "☃️", "🎩", "🕷", "😈", "🤢", "💩", "🙀", "🤡", "🤬", "👀"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            //let x = 5.arc4random
            //let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
       return emoji[card.identifier] ?? "?"
    }
    // TODO: shuffle cards
    
    // TODO: somewhere, wait few seconds and if match, clear cards
}
    
extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0  {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
            }
        }
    }

