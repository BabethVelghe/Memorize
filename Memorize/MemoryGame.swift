//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Pieter Velghe on 04/10/2023.
//
// MODEL
import Foundation // nothing in Model is SWIFTUI

// acces control --> private (set)
//het mag alles zijn maar het moet equatable zijn
struct MemoryGame<CardContent> where CardContent: Equatable { // now you can use the don't care everywhere in memorizeGame
    // acces control --> private (set)
    private (set) var cards : Array<Card> //
    
    init(numberOfPairs: Int, cardContentFactory : (Int) -> CardContent) {
        cards = []
        //add numberofPairs x2 cards
        for pairIndex in 0..<max(2,numberOfPairs){
            let content : CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex)a"))
            cards.append(Card( content: content, id: "\(pairIndex)b"))
        }
    }
    
    private var indexOfFaceUpCard: Int? {
        get {
            /*var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFacedUp {
                    faceUpCardIndices.append(index)
                }
            }*/
            // --> one of code
            //let faceUpCardIndices = cards.indices.filter { index in cards[index].isFacedUp}
          
            
            /*if  faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            }else {return nil}*/
            // --> one of code
            //return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
            // everything in one line with extension
            cards.indices.only { cards[$0].isFacedUp }
            
        }
        set {
            //cards.indices.forEach{ cards[$0].isFacedUp = (newValue == $0)}
            
            for index in cards.indices {
                cards[index].isFacedUp = index == newValue
            }
        }
    }
        
    mutating func chooseCards(_ card : Card){
        let chosenCard = cards.firstIndex(of: card)!
        if !cards[chosenCard].isFacedUp && !cards[chosenCard].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenCard].content == cards[potentialMatchIndex].content{
                    cards[chosenCard].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                indexOfFaceUpCard = chosenCard
            }
            cards[chosenCard].isFacedUp = true
        }
        
    }
    // mutating you have to set it because swift needs to know that you know it.
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    }
    // is good for nameSpacing
    // equabtable --> protocol en is nodig voor animatie
    // identifiable --> nodig voor de forEach in View
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible {
        /*static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFacedUp == rhs.isFacedUp &&
            lhs.isMatched == rhs.isMatched
            && lhs.content == rhs.content // type: don't care -->kan niet vergelijken met elkaar.
        }*/
        
        var isFacedUp: Bool = false // every card has to be faced down for the start
        var isMatched : Bool = false
        let content : CardContent // we are making this a don't care,
        var id: String
        // gebruik je om gemakkelijker te kunnen debuggen
        var debugDescription: String {
            "\(id): \(content) \(isFacedUp ? "up" : "down")\(isMatched ? " matched" : "")"
        }
    }
    
}
extension Sequence {
    
    func only(matching: (Element) -> Bool) -> Element? {
        let matches = filter(matching)
        return matches.count == 1 ? matches.first : nil
    }
}
