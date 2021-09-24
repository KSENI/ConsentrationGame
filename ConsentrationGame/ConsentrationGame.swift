//
//  ConsentrationGame.swift
//  ConsentrationGame
//
//  Created by Снигирева Ксения Игоревна local on 09.09.2021.
//

import Foundation

class ConsentrationGame {
    var cards = [Card]()
    var indexOneFaceUpCard : Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchingIndex = indexOneFaceUpCard , matchingIndex != index {
                if cards[matchingIndex].identifier == cards[index].identifier {
                    cards[matchingIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaseUp = true
                indexOneFaceUpCard = nil
            } else {
                for i in cards.indices {
                    cards[i].isFaseUp = false
                }
                cards[index].isFaseUp = true
                indexOneFaceUpCard = index
            }
        }
    }
    
    init(numberPairsCards: Int) {
        for _ in 1...numberPairsCards {
            let card = Card()
            cards += [card, card]
            cards.shuffle()
        }
    }
    
    func restart(numberPairsCards: Int) -> ConsentrationGame {
        cards = []
        indexOneFaceUpCard = nil
        return ConsentrationGame(numberPairsCards: numberPairsCards)
        
    }
}
