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
            context("when fetching pokemons from the service") {
                it("should fetch pokemons successfully") {
                    waitUntil(timeout: .seconds(10)) { done in
                        viewModel?.getPokemons {
                            expect(viewModel?.numberOfPokemon()) > 0
                            done()
                        }
                    }
                }
                
                it("should have 20 pokemons") {
                    waitUntil(timeout: .seconds(10)) { done in
                        viewModel?.getPokemons {
                            expect(viewModel?.numberOfPokemon()) == 20
                            done()
                        }
                    }
                }
                
                it("should return Bulbasaur as the first pokemon") {
                    waitUntil(timeout: .seconds(10)) { done in
                        viewModel?.getPokemons {
                            let pokemon = viewModel?.pokemon(at: 0)
                            expect(pokemon?.name?.lowercased()) == "bulbasaur"
                            done()
                        }
                    }
                }
                
                it("should return nil when no pokemons are fetched") {
                    let pokemon = viewModel?.pokemon(at: 0)
                    expect(pokemon).to(beNil())
                }
            }
        }
    }
}
