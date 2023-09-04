//
//  PokemonModel.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import Foundation

struct PokemonData: Decodable {
    let pokemons: [Results]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([Results].self, forKey: .results)
    }
}

struct Results: Decodable {
    var name: String?
    var url: String?
}
