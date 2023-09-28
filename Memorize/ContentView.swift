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
    var body: some View {
        HStack {
            CardView(facedUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.blue)
    }
}

struct CardView : View {
    // heeft te maken met tonen, niet van de app zelf
    @State var facedUp : Bool = false
    var body: some View {
        ZStack {
            // behaves like shape & view
             let base = RoundedRectangle(cornerRadius: 12 )
            // same thing
            //let base :RoundedRectangle = RoundedRectangle(cornerRadius: 12 )
            if facedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 6)
                Text("👻").font(.largeTitle)
            } else
            {
                base.fill()
            }
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
