//
//  MemorizeGame.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/25/23.
//
//For the pirsig game, you create cards, compamre them, and group them

import Foundation

//it def has a bunch of cards, and its an array of something, so ill call it Array<Card>

//how do we play our game? Choose cards, match them, whatever

//you have a bunch of cards, and you choose them

//model


struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        //could also say cards = [Card]()
        //could also do cards = []
//        cards = Array<Card>()
        cards = []
        //add numberOfPairsOfCards x 2 cards
        //the cards are always first going to be face down, and not going to be matched
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    func choose(_ card: Card) {
        
    }
    
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    
    //nested struct card
    //make dont care for content cuz we dont care if card content is a jpeg, img, or text
    struct Card {
        var isFaceUp = true
        var isMatched = false
        //the content on the card is not going to change so use let 
        let content: CardContent
        
    }
}
