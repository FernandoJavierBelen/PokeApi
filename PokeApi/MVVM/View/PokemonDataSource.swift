//
//  PokemonDataSource.swift
//  PokeApi
//
//  Created by Fernando Belen on 07/09/2023.
//

import Foundation
import UIKit

class PokemonDataSource: NSObject, UITableViewDataSource {
    var viewModel: PokemonViewModel
    
    init(viewModel: PokemonViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPokemon()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        if let pokemon = viewModel.pokemon(at: indexPath.row) {
            cell.configureCell(with: pokemon)
        }
        return cell
    }
}
