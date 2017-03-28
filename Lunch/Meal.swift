//
//  Meal.swift
//  Lunch
//
//  Created by Julianny Favinha on 3/24/17.
//  Copyright © 2017 Instituto de Pesquisas Eldorado. All rights reserved.
//

import Foundation

/// Class that describes a meal. A meal contains 3 properties: a symbol, a name and a price
class Meal {
    public var symbol: Character
    public var name: String
    public var price: Float
    
    init(symbol: Character, name: String, price: Float) {
        self.symbol = symbol
        self.name = name
        self.price = price
    }
}
