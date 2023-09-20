//
//  PokemonViewModelTests.swift
//  PokeApiTests
//
//  Created by Fernando Belen on 14/09/2023.
//

import Quick
import Nimble
@testable import PokeApi

class PokemonViewModelSpec: QuickSpec {
    override func spec() {
        var viewModel: PokemonViewModel?
        
        beforeEach {
            viewModel = PokemonViewModel()
        }
        
        afterEach {
            viewModel = nil
        }
        
        describe("PokemonViewModel") {
            it("should have 2 pokemons") {
                waitUntil { done in
                    viewModel?.getPokemons {
                        expect(viewModel?.numberOfPokemon()) == 20
                        done()
                    }
                }
            }
            
            it("should return Bulbasaur as the first pokemon") {
                waitUntil { done in
                    viewModel?.getPokemons {
                        let pokemon = viewModel?.pokemon(at: 0)
                        expect(pokemon?.name) == "bulbasaur"
                        done()
                    }
                }
            }
        }
    }
}
