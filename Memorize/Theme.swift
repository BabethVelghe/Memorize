//
//  Theme.swift
//  Memorize
//
//  Created by Pieter Velghe on 28/09/2023.
//

import SwiftUI
struct Theme {
    

    let name: String
    let symbol: String
    let deck: [String]
    
    static let animals = Self.init(name: "animals", symbol: "pawprint.fill", deck: ["🐵","🐶", "🐸", "🐙", "🐥", "🦋", "🐞", "🐯", "🐢", "🐡", "🐴"])
    static let vehicles = Self.init(name: "vehicles", symbol: "car.fill", deck: ["🚗", "🚌", "🏎️","🚛","🛴", "🚲", "🚡", "🚂", "✈️", "🚀", "🛶", "🚁", ])
    static let food = Self.init(name: "Food", symbol: "fork.knife", deck: ["🥞", "🍔", "🍕", "🥪", "🥗", "🍱", "🥟", "🥧", "🍿", "🍩", "🍪", "🍺"])
}
