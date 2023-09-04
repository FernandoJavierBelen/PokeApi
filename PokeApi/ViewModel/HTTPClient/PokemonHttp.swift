//
//  PokemonHttp.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import Foundation

class PokemonHttp {
    
    func getPokemons(completion: @escaping ([Results]) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error en la respuesta de la solicitud")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(PokemonData.self, from: data)
                let pokemonArray = decodedData.pokemons
                completion(pokemonArray) // Llama a la clausura de finalización con los datos decodificados
            } catch {
                print("Error al decodificar los datos: \(error.localizedDescription)")
            }
        }.resume()
    }
}
