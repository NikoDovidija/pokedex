//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Niko on 12/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonDefence: UILabel!
    @IBOutlet weak var pokemonDescription: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var currentPokemonState: UILabel!
    @IBOutlet weak var pokemonNextEvolutionFirst: UILabel!
    @IBOutlet weak var pokemonNextEvolution: UILabel!
    @IBOutlet weak var pokemonBaseAttack: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonID: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonType: UILabel!
    
    @IBOutlet weak var mainPokeImage: UIImageView!
    
    @IBOutlet weak var sidePokeImage1: UIImageView!
    var _pokemon: Pokemon!
    
    @IBOutlet weak var sidePokeImage2: UIImageView!
    @IBAction func backButtonPRessed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = _pokemon.pokeName.capitalized
        currentPokemonState.text = _pokemon.pokeName.capitalized
        
        _pokemon.callForData {
            print("Did")
            self.updateUI()
        }
       
    }

    func updateUI(){
     pokemonBaseAttack.text = "\(_pokemon.baseAttack)"
     pokemonDefence.text = "\(_pokemon.def)"
     pokemonHeight.text = "\(_pokemon.height)"
     pokemonWeight.text = "\(_pokemon.weight)"
     pokemonID.text = "\(_pokemon.pokeID)"
     mainPokeImage.image = UIImage(named: "\(_pokemon.pokeID)")
     sidePokeImage1.image = UIImage(named: "\(_pokemon.pokeID)")
     pokemonType.text = _pokemon.type
     pokemonDescription.text = _pokemon.pokeDescp
        if _pokemon.nextEvolutionLVL == 0{
              pokemonNextEvolutionFirst.text = "Mega level "
            pokemonNextEvolution.isHidden = true
            sidePokeImage2.isHidden = true
        }
        else{
            pokemonNextEvolution.text = _pokemon.nextEvolution
            pokemonNextEvolution.isHidden = false
            sidePokeImage2.isHidden = false
            pokemonNextEvolutionFirst.text = "Next evolution \(_pokemon.nextEvolution) at level \(_pokemon.nextEvolutionLVL) "
            sidePokeImage2.image = UIImage(named: "\(_pokemon.nextEvolutionID)")
        }

    }

    
    


}
