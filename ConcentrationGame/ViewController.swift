//
//  ViewController.swift
//  ConcentrationGame
//
//  Created by Celal Aslan on 2018-05-22.
//  Copyright © 2018 Celal Aslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
    flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var emojiOptions = ["🎃","👻","🎃","👻"]
    

    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard1(_ sender: UIButton) {
        flipCount += 1
        if let cardIndex = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiOptions[cardIndex], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.3355934262, green: 0.1389290372, blue: 0.1151548498, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
}

