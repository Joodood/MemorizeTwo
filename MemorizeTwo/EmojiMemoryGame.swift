//
//  EmojiMemoryGame.swift
//  MemorizeTwo
//
//  Created by Jude Hathway on 11/25/23.
//
//imports swift u i because ur viewmodel is packaging up the model for the ui so it has to know what the ui looks like

//viewmodel

import SwiftUI

//func createCardContent(forPairAtIndex index: Int) -> String {
//    return ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽"][index]
//}


//this is global
//let emojis = ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️"]
//

//it reads as the model is a memory game with this many cards (pictures of emojis) and we create the cards by using this pairindex to index inside the array


class EmojiMemoryGame {
    //static means make emojis global, but namespace it inside my class
    //now its a private global variable only for us to use
    
    //by making that global i will be making sure i initialize it before i use it here
    //global vars will be intialized first
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "🎅", "👻", "🎃", "🕷️", "😈", "🤰🏽", "👻", "🎃", "🕷️"]

    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>( numberOfPairsOfCards: 4) { pairIndex in
            return EmojiMemoryGame.emojis[pairIndex]
        }
    }
        //this model is going to create a MemoryGame of type String, specified the dont care which is a string
    
    //we call var and lets properties in swift
    //so this is a property called model, its a var and ur initializing it here, or else you would need an init, so here your giiving it an initial value
    //the order that your properties are initialized is undetermined
    //you cant use one class to initialize another they all go at once
//    private var model: MemoryGame<String> = MemoryGame<String>( numberOfPairsOfCards: 4) { pairIndex in
//        return EmojiMemoryGame.emojis[pairIndex]
//        }
    
    private var model = EmojiMemoryGame.createMemoryGame()
    

    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    //put the _ because its clear to card we have a card it is a card
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}


