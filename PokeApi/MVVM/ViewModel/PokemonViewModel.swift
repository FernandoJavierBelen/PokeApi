//
//  PokemonViewModel.swift
//  PokeApi
//
//  Created by Fernando Belen on 07/09/2023.
//

import Foundation

class PokemonViewModel {
    private let pokemonService = PokemonService()
    private var pokemon: [PokemonModel] = []
    
    func getPokemons(completion: @escaping () -> Void) {
        pokemonService.getPokemons { [weak self] data in
            self?.pokemon = data
            completion()
        }
    }
    
    func numberOfPokemon() -> Int {
        return pokemon.count
    }
    
    func pokemon(at index: Int) -> PokemonModel? {
        guard index >= 0, index < pokemon.count else {
            return nil
        }
        return pokemon[index]
    }
}
