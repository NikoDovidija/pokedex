//
//  File.swift
//  Pokedex
//
//  Created by Niko on 08/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import Foundation



let cellInden = "pokeCell"
let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
let VC_IDEN = "pokemonDetailVC"
let URL_BASE = "http://pokeapi.co"
let URL_POKEMON = "/api/v1/pokemon/"

typealias downloadComplete = () -> ()
