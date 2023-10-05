//
//  ContentView.swift
//  Memorize
//
//  Created by Pieter Velghe on 27/09/2023.
//

import SwiftUI
// struct --> structure , kunnen variabelen & function ==> geen klasse !!!
struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    // moet enkel dit hebben
    private let aspectRatio : CGFloat = 2/3
    var body: some View {
        VStack {
            Text("Memorize! ").font(.largeTitle)

                cards
                    .animation(.default, value: viewModel.cards)
            Button("shuffle"){
                viewModel.shuffle()
            }
            /*HStack(alignment: .firstTextBaseline,spacing: 52){
                Spacer()
                
                select_button_theme(Theme.animals)
                select_button_theme(Theme.food)
                select_button_theme(Theme.vehicles)
                Spacer()
            }*/
            
        }
        .padding()
       /* .onAppear{
            selectDeck(Theme.animals)
        }*/
    }
    var cards : some View {
        AspectVGrid(viewModel.cards, aspectRatio: 2/3) { card in
       
            //LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing:0)], spacing: 0) {
                // van zero up to for ..<
                // van zero up to three ...
                // geeft waarde terug
                // probleem bij animatie ==> we willen niet dat de indexen worden gewisseld maar we willen dat de kaarten worden gewisseld Waarom? geen mooie animmatie mogelijk
                
                /*ForEach(viewModel.cards.indices, id: \.self){ index in
                 CardView(viewModel.cards[index])
                 .aspectRatio(2/3, contentMode: .fit)
                 .padding(3)
                 }*/
                // foutmelding op \.self door dat we het op card doen zijn ze niet meer uniek ( je hebt dezelfde kaarten )
                //ForEach(viewModel.cards){ card in
                    CardView(card)
                        .padding(3)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    //}
            }.foregroundColor(.orange)
        }
        func gridItemWidthThatFits(
            count: Int,
            size: CGSize,
            atAspectRatio aspectRatio : CGFloat
        ) -> CGFloat {
            let count  = CGFloat(count)
            var columnCount = 1.0
            repeat {
            let itemWidth = size.width / columnCount
            let itemHeight = itemWidth / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * itemHeight < size.height {
                return itemWidth.rounded(.down)
            } else {
                columnCount += 1
            }
            } while columnCount < count
            return min(size.width / count, size.height * aspectRatio).rounded(.down)
        }
    
    
 /*   func selectDeck (_ theme: Theme){
        view = theme.deck
            .flatMap{ ([$0, $0])}
            .shuffled()
    }*/
    
    func select_button_theme(_ theme : Theme) -> some View {
        Button(action : {
            //selectDeck(theme)
        }, label : {
            VStack {
                Image(systemName: theme.symbol).font(.title)
                
                Text(theme.name).font(.caption2)
            }
            
            
        })
    }
    /*
    var cardCountadjusters : some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
            .imageScale(.large)
            .font(.largeTitle)
    }
    // by --> de persoon die deze functie aanroept
    func cardCountAdjuster(by offset : Int,  symbol : String) -> some View {
        Button(action : {
            cardCount += offset
        }, label: {
            Image(systemName : symbol)
        })
        .disabled(cardCount + offset < 1  ||  cardCount + offset > emojis.count)
        
    }
    var cardRemover : some View {
         cardCountAdjuster(by: -1, symbol: "minus.circle")
    }
    var cardAdder : some View {
         cardCountAdjuster(by: +1, symbol: "plus.circle")
    }*/
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
