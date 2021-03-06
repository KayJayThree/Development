//
//  Card.swift
//  Concentration
//
//  Created by admin on 8/18/18.
//  Copyright © 2018 JeuxMedia. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(identifier: Int) {
        self.identifier = identifier
        
    }
    
}
