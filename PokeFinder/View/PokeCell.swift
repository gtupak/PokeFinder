//
//  PokeCell.swift
//  PokeFinder
//
//  Created by Gabriel T on 2017-10-02.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokeId: Int) {
        nameLbl.text = pokemon[pokeId].capitalized
        thumbImg.image = UIImage(named: "\(pokeId + 1)")
    }
    
}
