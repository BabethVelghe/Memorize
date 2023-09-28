//
//  ContentView.swift
//  Memorize
//
//  Created by Pieter Velghe on 27/09/2023.
//

import SwiftUI
// struct --> structure , kunnen variabelen & function ==> geen klasse !!!
struct ContentView: View {
    // moet enkel dit hebben
    @State var emojis: Array<String> = []
     
    var body: some View {
        VStack {
            Text("Memorize! ").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            HStack(alignment: .firstTextBaseline,spacing: 52){
                Spacer()
                
                select_button_theme(Theme.animals)
                select_button_theme(Theme.food)
                select_button_theme(Theme.vehicles)
                Spacer()
            }
            
        }
        .padding()
        .onAppear{
            selectDeck(Theme.animals)
        }
    }
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // van zero up to for ..<
            // van zero up to three ...
            // geeft waarde terug
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content : emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }

        }.foregroundColor(.orange)
    }
    
    func selectDeck (_ theme: Theme){
        emojis = theme.deck
            .flatMap{ ([$0, $0])}
            .shuffled()
    }
    
    func select_button_theme(_ theme : Theme) -> some View {
        Button(action : {
            selectDeck(theme)
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
