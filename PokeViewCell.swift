//
//  PokeViewCell.swift
//  Pokedex
//
//  Created by Niko on 04/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import UIKit

class PokeViewCell: UICollectionViewCell {
    @IBOutlet weak var pokeImage: UIImageView!
  
    @IBOutlet weak var pokename: UILabel!
    private var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    func initCell(pokemon: Pokemon){
        self.pokemon=pokemon
        self.pokeImage.image=UIImage(named: "\(pokemon.pokeID)")
        self.pokename.text=pokemon.pokeName
    }
    
    

}
