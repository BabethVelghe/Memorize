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
    let emojis: Array<String> = ["🐵","🐶", "🐸", "🐙", "🐥", "🦋", "🐞", "🐯", "🐢", "🐡", "🐴"]
     @State var cardCount: Int = 4
    // let emojis: [String] = ["🐵","🐶", "🐸", "🐙"]
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountadjusters
            
        }
        .padding()
    }
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // van zero up to for ..<
            // van zero up to three ...
            // geeft waarde terug
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content : emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }

        }.foregroundColor(.orange)
    }
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
    }
}

struct CardView : View {
    let content :String
    // heeft te maken met tonen, niet van de app zelf
    @State var facedUp : Bool = true
    
    var body: some View {
        ZStack {
            // behaves like shape & view
             let base = RoundedRectangle(cornerRadius: 12 )
            // same thing
            //let base :RoundedRectangle = RoundedRectangle(cornerRadius: 12 )
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 6)
                Text(content).font(.largeTitle)
            }
            base.fill().opacity(facedUp ? 0 : 1)
           // onTapGesture(count : 2 ) { --> dubbelklik
            // geen viewbuilder -> normaal code (
        }.onTapGesture {
            // de logica om de kaarten te wisselen zal gebeuren in backend,
            // @State zal nie meer gebruikt worden
            facedUp.toggle() // toggle wisselt van true to false or false to true
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
