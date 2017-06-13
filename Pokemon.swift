//
//  Pokemon.swift
//  Pokedex
//
//  Created by Niko on 04/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import Foundation
import Alamofire
class Pokemon{
    private var _pokemonID: Int!
    private var _pokemonName: String!
    private var _pokemonDesp: String!
    private var _type : String!
    private var _def: Int!
    private var _height: Int!
    private var _weight: Int!
    private var _baseAttack: Int!
    private var _pokemonURL: String!
    private var _nextEvolution: String!
    init(pokeName: String,pokeID: Int){
        self._pokemonName=pokeName
        self._pokemonID=pokeID
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokeID)"
    }
    
    
    func callForData(completed: @escaping downloadComplete){
        
           request(self._pokemonURL).responseJSON(completionHandler: { response in
                print(response.result)
                let pokemonJson = response
            
                if let mainDict = pokemonJson.value as? Dictionary<String,AnyObject>{
                    if let attackValue = mainDict["attack"] as? Int{
                        self._baseAttack=attackValue
                        }
                    if let height = mainDict["height"] as? String{
                        self._height=Int(height)
                        }
                    if let weight = mainDict["weight"] as? String{
                        self._weight=Int(weight)
                        }
                    if let def = mainDict["defense"] as? Int{
                        self._def=def
                        }
                    if let type = mainDict["types"] as? Array<Dictionary<String,String>>, type.count>0{
                        if let name = type[0]["name"]{
                            self._type = name.capitalized
                        }
                        if type.count>1{
                            for x in 1..<type.count{
                                if let name = type[x]["name"]{
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                        
                    }
                    else{
                        self._type=" "
                    }
                }
                completed()
           })
    
            
    }
    var pokeID: Int{
        if _pokemonID == nil{
            _pokemonID = 0
        }
        return _pokemonID
    }
    var nextEvo: String{
        if _nextEvolution == nil{
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    var pokeName: String{
        if _pokemonName == nil{
            _pokemonName = ""
        }
        return _pokemonName
    }
    
    var pokeDescp: String{
        if _pokemonDesp == nil{
            _pokemonDesp = ""
        }
        return _pokemonDesp
    }
    var type : String{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    var def: Int{
        if _def == nil{
            _def = 0
        }
        return _def
    }
    var height: Int{
        if _height == nil{
            _height = 0
        }
        return _height
    }
    var weight: Int{
        if _weight == nil{
            _weight = 0
        }
        return _weight
    }
    var baseAttack: Int{
        if _baseAttack == nil{
            _baseAttack = 0
        }
        return _baseAttack
    }
    
}
