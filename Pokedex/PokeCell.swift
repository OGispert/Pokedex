//
//  PokeCell.swift
//  Pokedex
//
//  Created by Othmar Gispert on 12/6/16.
//  Copyright © 2016 Othmar Gispert. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 0.5
        
    }
    
    func configureCell (_ pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
