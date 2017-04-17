//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Othmar Gispert on 12/7/16.
//  Copyright © 2016 Othmar Gispert. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var evolutionLbl: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    
    
    var pokemon: Pokemon!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        pokeImage.image = img
        currentEvoImage.image = img
        
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetail {
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        baseAttackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvoId == "" {
            
            evolutionLbl.text = "No Evolutions"
            //nextEvoImage.isHidden = true
        } else {
            
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvoId)
            
            let str = "Next Evolution \(pokemon.nextEvoName) - LVL: \(pokemon.nextEvoLvl)"
            
            evolutionLbl.text = str
        }
        
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
