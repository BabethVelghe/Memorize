//
//  CardView.swift
//  Memorize
//
//  Created by Pieter Velghe on 28/09/2023.
//

import SwiftUI
struct CardView : View {
    typealias Card = MemoryGame<String>.Card
    let card : Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        /*ZStack {
            // behaves like shape & view
             let base = RoundedRectangle(cornerRadius: 12 )
            // same thing
            //let base :RoundedRectangle = RoundedRectangle(cornerRadius: 12 )
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 6)
                Text(card.content)
                    .font(.system(size:Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor) // if this font is to big you can scale it down to 0.01
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(5)
            }.opacity(card.isFacedUp ? 1 : 0)
            base.fill().opacity(card.isFacedUp ? 0 : 1)
           // onTapGesture(count : 2 ) { --> dubbelklik
            // geen viewbuilder -> normaal code (
        }
        // | -> alt + shift + L
        .opacity(card.isFacedUp || !card.isMatched ? 1 : 0)*/
        
        Pie(endAngle: .degrees(240))
                  .opacity(Constants.Pie.opacity)
                  .overlay(
                      Text(card.content)
                          .font(.system(size: Constants.FontSize.largest))
                          .minimumScaleFactor(Constants.FontSize.scaleFactor)
                          .multilineTextAlignment(.center)
                          .aspectRatio(1, contentMode: .fit)
                          .padding(Constants.Pie.inset)
                  )
                  .padding(Constants.inset)
                  .cardify(isFaceUp: card.isFaceUp)
                  .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
    }
}

extension CardView {
    
    private enum Constants {

        static let inset: CGFloat = 5
        
        enum FontSize {
            
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        
        enum Pie {
            
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}


struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    static var previews: some View {
        VStack {
                HStack {
                    CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                        .padding(4)
                        .foregroundColor(.green)
                    CardView(Card(content: "X", id: "test"))
                        .padding(4)
                        .foregroundColor(.green)
                }
                HStack {
                    CardView(Card(isFaceUp: true, isMatched: true, content: "This is a very long string and I hope it fits",   id: "test"))
                        .padding(4)
                        .foregroundColor(.green)
                    CardView(Card(isMatched: true, content: "X", id: "test"))
                        .padding(4)
                        .foregroundColor(.green)
                }
            }
    }
}
