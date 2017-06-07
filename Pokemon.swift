//
//  Pokemon.swift
//  Pokedex
//
//  Created by Niko on 04/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import Foundation

class Pokemon{
    private var _pokemonID: Int!
    private var _pokemonName: String!
    
    init(pokeName: String,pokeID: Int){
        self._pokemonName=pokeName
        self._pokemonID=pokeID
    }
    
    var pokeID: Int{
        return _pokemonID
    }
    
    var pokeName: String{
        return _pokemonName
    }
    
    
}
