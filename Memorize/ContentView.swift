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
    var facedUp : Bool = false
    var body: some View {
        ZStack(content : {
            if facedUp {
                // behaves like shape & view
                RoundedRectangle(cornerRadius: 12 )
                    .fill(.white)
                //    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12 )
                // gekunt niet de rectangle een boord geven en opvullen 1 van de twee!!
                    .strokeBorder(lineWidth: 6)
                Text("👻").font(.largeTitle)
            } else
            {
                RoundedRectangle(cornerRadius: 12 )
            }
           
        })
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
