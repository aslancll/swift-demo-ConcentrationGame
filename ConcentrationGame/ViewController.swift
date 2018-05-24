//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Celal Aslan on 2018-05-22.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration.init(numberOfPairsOfCards: cardButtons.count / 2 )
    
    var flipCount = 0 {
        didSet {
    flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiOptions = ["🎃","👻","☠️","🤖","🎮","🎳","🏆","🏀","🎱","🥊"]
    var emoji = [Int: String]()
    
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel!
    
    // MARK: Methods
    @IBAction func touchCard1(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender) {
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.3355934262, green: 0.1389290372, blue: 0.1151548498, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiOptions.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiOptions.count)))
            emoji[card.identifier] = emojiOptions.remove(at: randomIndex)
        }
        //return if conditions are true return identifier if not return question mark
        return emoji[card.identifier] ?? "?"
    }
    
    
    
    
//
//    func flipCard(withEmoji emoji: String, on button: UIButton) {
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0.3355934262, green: 0.1389290372, blue: 0.1151548498, alpha: 1)
//        } else {
//            button.setTitle(emoji, for: UIControlState.normal)
//            button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        }
//    }
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

