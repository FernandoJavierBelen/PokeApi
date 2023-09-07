//
//  PokemonModel.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import Foundation

struct PokemonData: Decodable {
    let results: [PokemonModel]
}

struct PokemonModel: Decodable {
    var name: String?
    var url: String?
}
