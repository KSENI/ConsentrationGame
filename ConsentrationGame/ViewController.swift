//
//  ViewController.swift
//  ConsentrationGame
//
//

import UIKit

class ViewController: UIViewController {
    lazy var game = ConsentrationGame(numberPairsCards: (buttonCollection.count + 1) / 2)
    var touches = 0 {
        didSet {
            touchesLabel.text = "Touches: \(touches)"
        }
    }

    var emodji = ["🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐠", "🐳", "🐟", "🐬", "🦭", "🦈"]
    var emodjiDictionary = [Int: String]()
    
    func emodjiId(for card: Card) -> String {
        if emodjiDictionary[card.identifier] == nil {
            let randomIndex =  Int(arc4random_uniform(UInt32(emodji.count)))
            emodjiDictionary[card.identifier] = emodji.remove(at: randomIndex)
        }
        return emodjiDictionary[card.identifier] ?? "?"
    }
    
    func updateViewFromModel() {
        for i in buttonCollection.indices {
            let button = buttonCollection[i]
            let card = game.cards[i]
            if card.isFaseUp {
                button.setTitle(emodjiId(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0): #colorLiteral(red: 0, green: 0.4575358629, blue: 0.921263814, alpha: 1)
            }
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBAction func buttonAction(_ sender: UIButton) {
        touches += 1
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    @IBAction func restart(_ sender: UIButton) {
        emodji = ["🐙", "🦑", "🦐", "🦞", "🦀", "🐡", "🐠", "🐳", "🐟", "🐬", "🦭", "🦈"]
        emodjiDictionary = [ : ]
        touches = 0
        game = game.restart(numberPairsCards: (buttonCollection.count + 1) / 2)
        updateViewFromModel()
    }
}

