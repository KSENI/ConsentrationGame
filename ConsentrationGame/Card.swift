//
//  Card.swift
//  ConsentrationGame
//
//  Created by Снигирева Ксения Игоревна local on 09.09.2021.
//

import Foundation

struct Card {
    var isFaseUp = false
    var isMatched = false
    var identifier : Int
    
    static var identifierNumber = 0
    static func idGenerator() -> Int {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.identifier = Card.idGenerator()
    }
}
