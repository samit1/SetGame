//
//  SetGame.swift
//  SetGame
//
//  Created by Sami Taha on 5/11/18.
//  Copyright © 2018 taha.sami. All rights reserved.
//

import Foundation

struct SetGame {
    private var cardDeck = CardDeck().cardSet
    
    private (set) var cardsInPlay = [Card]()
//    private (set) var matchedCards = [Card]()
    private (set) var cardsSelected = [Card]() {
        didSet {
            for (i,card) in cardsSelected.enumerated() {
                print("\(i): \(card.description) ")
            }
        }
    }
    
    
    
    //    var cardsSelected = [Card: Bool ]()
    
    mutating func cardSelected(card: Card) {
        //add card in card selected
        
        // if we already have 3, check for set or not set.
        // if set, then add to matchedcards. then replace the 3 (if possible). Don't add itself twice.
        //
        if checkForSet() {
            setFound()
            add3CardsToPlay()
        } else {
            // if cards are not set
            // then clear selection
            // and add new card as first element in selection
            if cardsSelected.count == 3 {
                cardsSelected.removeAll()
                cardsSelected.append(card)
            } else {
                cardsSelected.append(card)
            }
        }
    }
    
    private func checkForSet() -> Bool {
        // we can only have 3 total cards.
        // A set is matched so long as you don't have 2 of one type of card
        // So, we can pull the type in the card with the map function, and put into an array
        // If the unique count of the set is 2, that means that 3 of our cards had 2 unique values.
        // Per the rules of the game Set, if you can sort a group of three cards into two of _ and one of _ then it is not a set.
        
        if cardsSelected.count == 3 {
//            let a  = cardsSelected.map {cardsSelected[$0.color.rawValue}
            let num = Set(cardsSelected.map {$0.num}).count
            let symbol = Set(cardsSelected.map {$0.symbol}).count
            let shading = Set(cardsSelected.map {$0.shading}).count
            let color = Set(cardsSelected.map {$0.color}).count
            
            return num != 2 && symbol != 2 && shading != 2 && color != 2
        }
        return false
    }
    
    // when a set is found
    // add it to the matched cards
    // removed selection
    // add 3 cards to play
    mutating private func setFound() {
//        matchedCards += cardsSelected
        cardsSelected.removeAll()
    }
    
    mutating func add3CardsToPlay() {
        
        // either "replace cards" or add 3 more
        // to "replace cards" we check if there is a set.
        // if a set is found, then we call the setFound method
        // either way we want to add 3 cards which is done after
        
        if(checkForSet()) {setFound()}
        
        
        if cardDeck.count >= 3 {
            cardsInPlay.append(cardDeck.remove(at: 0))
            cardsInPlay.append(cardDeck.remove(at: 1))
            cardsInPlay.append(cardDeck.remove(at: 2))
        }
    }
    
    init() {
        for _ in stride(from: 0, to: 13, by:  1) {
            cardsInPlay.append(cardDeck.removeFirst())
        }
    }
    
    
    
    
    
    
}