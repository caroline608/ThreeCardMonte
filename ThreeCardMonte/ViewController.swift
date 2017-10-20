//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Keshawn Swanston on 10/16/17.
//  Copyright © 2017 Caroline Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
 
    @IBOutlet weak var displayLabel: UILabel!
    
    
    @IBOutlet weak var card1: UIButton!
    @IBOutlet weak var card2: UIButton!
    @IBOutlet weak var card3: UIButton!
    @IBOutlet weak var card4: UIButton!
    @IBOutlet weak var card5: UIButton!
    

    
    @IBAction func cardFlipsbuttonPressed( _ sender: UIButton) {
        if card4.isHidden == true {
            var cards = [#imageLiteral(resourceName: "Queen"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "Four")]
            cards.shuffle()
            print(cards)
            let guess = cards[sender.tag]
            if guess == #imageLiteral(resourceName: "Queen") {
                self.displayLabel.text = "You win!"
            } else {
                self.displayLabel.text = "You lose!"
            }
            var cardViews = [card1, card2, card3]
            for i in 0..<3 {
                cardViews[i]?.setImage(cards[i], for: .normal)
            }
        } else if card5.isHidden == true {
            var cards = [#imageLiteral(resourceName: "Queen"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "Four"),#imageLiteral(resourceName: "three")]
            cards.shuffle()
            print(cards)
            let guess = cards[sender.tag]
            if guess == #imageLiteral(resourceName: "Queen") {
                self.displayLabel.text = "You win!"
            } else {
                self.displayLabel.text = "You lose!"
            }
            var cardViews = [card1, card2, card3, card4]
            for i in 0..<4 {
                cardViews[i]?.setImage(cards[i], for: .normal)
            }
        } else {
            card5.isHidden == false
            var cards = [#imageLiteral(resourceName: "Queen"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "Four"),#imageLiteral(resourceName: "three"),#imageLiteral(resourceName: "Four")]
            cards.shuffle()
            print(cards)
            let guess = cards[sender.tag]
            if guess == #imageLiteral(resourceName: "Queen") {
                self.displayLabel.text = "You win!"
            } else {
                self.displayLabel.text = "You lose!"
            }
            var cardViews = [card1, card2, card3, card4, card5]
            for i in 0..<5 {
                cardViews[i]?.setImage(cards[i], for: .normal)
            }
        }
            
//        switch sender.tag {
//        case 0:
//            gameResult = "lose!"
//        case 1:
//            gameResult = "lose!"
//        case 2:
//            gameResult = "WIN!"
//        default:
//            gameResult = "did something wrong!"
//        }
        card1.isEnabled = false
        card2.isEnabled = false
        card3.isEnabled = false
        card4.isEnabled = false
        card5.isEnabled = false
    
    }
   

    
    @IBAction func startsNewGame(_ sender: UIButton) {
        switch sender.tag {
        case 0:
        card1.isEnabled = true
        card2.isEnabled = true
        card3.isEnabled = true
        card4.isHidden = true
        card5.isHidden = true
        self.displayLabel.text = "Pick a card, any card!"
        case 1:
            card1.isEnabled = true
            card2.isEnabled = true
            card3.isEnabled = true
            card4.isHidden = false
            card4.isEnabled = true
            card5.isHidden = true
            self.displayLabel.text = "Pick a card, any card!"
        case 2:
            card1.isEnabled = true
            card2.isEnabled = true
            card3.isEnabled = true
            card4.isHidden = false
            card4.isEnabled = true
            card5.isHidden = false
            card5.isEnabled = true
            self.displayLabel.text = "Pick a card, any card!"
        default:
            self.displayLabel.text = "did something wrong!"
                    }
        var cardView = [card1, card2, card3, card4, card5]
        for i in 0..<5 {
            cardView[i]?.setImage(#imageLiteral(resourceName: "cardback"), for: .normal)
        }
    }
    }
//https://stackoverflow.com/questions/37843647/shuffle-array-swift-3
extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

