//
//  AddNewPokemonVC.swift
//  PokeFinder
//
//  Created by Gabriel T on 2017-10-02.
//  Copyright © 2017 Gabriel T. All rights reserved.
//

import UIKit

class AddNewPokemonVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    var location: CLLocation!
    var geoFire: GeoFire!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonCollection.dataSource = self
        pokemonCollection.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            cell.configureCell(pokeId: indexPath.row)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func createSighting(forLocation location: CLLocation, withPokeon pokeId: Int) {
        geoFire.setLocation(location, forKey: "\(pokeId)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Save pokemon
        createSighting(forLocation: location, withPokeon: indexPath.row)
        dismiss(animated: true, completion: nil)
    }
    
}
