//
//  ViewController.swift
//  Pokedex
//
//  Created by Niko on 04/06/2017.
//  Copyright © 2017 Niko. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    var musicPlayer:AVAudioPlayer!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var pokemons = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var inSearchMode = false
    
    func initAudio(){
        
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        }catch let err as NSError{
                print(err.debugDescription)
        }
    }
    @IBAction func musicButtonPressed(_ sender: UIButton) {
        if(musicPlayer.isPlaying){
            musicPlayer.pause()
            sender.alpha = 0.2
        }
        else{
            musicPlayer.play()
            sender.alpha = 1.0
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        parsePokemonCSV()
        initAudio()
    }
    
    func parsePokemonCSV(){
        do{
            let csv = try  CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows{
                let pokeID = Int(row["id"]!)
                let name = row["identifier"]!
                let pokemon = Pokemon(pokeName: name, pokeID: pokeID!)
                pokemons.append(pokemon)
            }
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let poke: Pokemon!
        
        if inSearchMode{
            poke = filteredPokemon[indexPath.row]
        }
        else{
            poke = pokemons[indexPath.row]
        
        }
        performSegue(withIdentifier: VC_IDEN, sender: poke)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == VC_IDEN{
            if let details = segue.destination as? PokemonDetailViewController{
                if let poke = sender as? Pokemon{
                    details._pokemon = poke
                  
                }
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellInden, for: indexPath) as? PokeViewCell{
            let pok: Pokemon!
            if(inSearchMode){
                pok = self.filteredPokemon[indexPath.row]
            }
            else{
                pok = self.pokemons[indexPath.row]
         
            }
            cell.initCell(pokemon: pok)
              return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(inSearchMode){
            return filteredPokemon.count
        }
        else{
             return pokemons.count
        }
       
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 105, height: 105)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        }
        else{
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemon = pokemons.filter({$0.pokeName.range(of: lower) != nil})
            collectionView.reloadData()
        }
        
}
}

