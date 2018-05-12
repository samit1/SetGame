//
//  ViewController.swift
//  SetGame
//
//  Created by Sami Taha on 5/11/18.
//  Copyright © 2018 taha.sami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var game = SetGame()
    //    @IBOutlet weak var cardBtn: UIButton!
    
    @IBOutlet var cardBtns: [UIButton]!
    // call this when the buttons first get loaded
    //
    //        didSet {
    //
    //            for card in game.cardsInPlay.indices {
    //                if cardBtns.count >= card {
    //                    cardBtns[card].setTitle(game.cardsInPlay[card].color.rawValue, for: UIControlState.normal)
    //                }
    //            }
    //        }
    
    
    @IBAction func dealMoreCardsBtnTapped(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var deal3MoreCardsBtn: UIButton!
    @IBAction func cardBtnTapped(_ sender: UIButton) {
//        let cardSelected = game.cardsInPlay[index(of: sender)
        
        let selectedIndex = cardBtns.index(of: sender)
        let selectedCard = game.cardsInPlay[selectedIndex!]
        game.cardSelected(card: selectedCard)

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateViewFromModel()
        
    }
    
    private func updateViewFromModel() {
        for (index, card) in game.cardsInPlay.enumerated() {
            cardBtns[index].titleLabel?.numberOfLines = 0
//            cardBtns[index].setAttributedTitle(setCardTitle(with: game.cardsInPlay.index(of: <#T##Card#>) , for: .normal)
            cardBtns[index].setAttributedTitle(setCardTitle(with: card), for: .normal)
        }
    }
    
    private func setCardTitle(with card: Card ) -> NSAttributedString {
        let attributes:  [NSAttributedStringKey : Any] = [
            .strokeWidth : CardToView.shading[card.shading]!,
            .strokeColor : CardToView.color[card.color]!,
            NSAttributedStringKey.foregroundColor : CardToView.color[card.color]!.withAlphaComponent(CardToView.shading[card.shading]!)
        ]
        
        let theTitle = CardToView.symbol[card.symbol]
        
        let attrTitle = NSAttributedString(string: theTitle!, attributes: attributes)
        return attrTitle
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
fileprivate struct CardToView {
    static let symbol: [Card.Symbol : String] = [.diamond: "▲", .squiggle: "●", .oval: "■"]
    static let color: [Card.Color : UIColor] = [.red: UIColor.red, .green: UIColor.green, .purple: UIColor.purple]
    static let shading : [Card.Shading : CGFloat] = [.solid: -5, Card.Shading.open: 30, .striped: 10]
    
    
    
}
