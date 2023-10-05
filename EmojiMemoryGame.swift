//
//  EmoijMemoryGame.swift
//  Memorize
//
//  Created by Pieter Velghe on 04/10/2023.
//
// VIEWMODEL -->
import SwiftUI // your ViewModel is a part of the UI, it has to know how the ui looks like , but it is not going to creating Views

// you have to put the superclass first and then the behavesomethinglike
class EmojiMemoryGame : ObservableObject{
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["🥞", "🍔", "🍕", "🥪", "🥗", "🍱", "🥟", "🥧", "🍿", "🍩", "🍪", "🍺"]
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairs: 12) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return emojis[pairIndex]
            }else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame()
    // if you make it private --> full seperation
    var cards : Array<Card> {
        return model.cards
    }
    //MARK: - Intents
    func shuffle() {
        return model.shuffle()
    }
    
    // intent function
    //external name first name --> _ : means you dont have to use a external name when you call the function
    func choose(_ card: Card ) {
        model.chooseCards(card)
    }
}
