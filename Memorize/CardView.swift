//
//  CardView.swift
//  Memorize
//
//  Created by Pieter Velghe on 28/09/2023.
//

import SwiftUI
struct CardView : View {
    let content :String
    // heeft te maken met tonen, niet van de app zelf
    @State var facedUp : Bool = false
    
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
