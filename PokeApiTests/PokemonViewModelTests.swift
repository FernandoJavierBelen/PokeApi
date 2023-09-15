//
//  PokemonViewModelTests.swift
//  PokeApiTests
//
//  Created by Fernando Belen on 14/09/2023.
//

import XCTest
@testable import PokeApi

class PokemonViewModelTests: XCTestCase {
    
    var viewModel: PokemonViewModel?

    override func setUp() {
        super.setUp()
        viewModel = PokemonViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testNumberOfPokemon() {
        viewModel?.getPokemons {
            XCTAssertEqual(self.viewModel?.numberOfPokemon(), 2)
         
        }
    }

    func testPokemonAtIndex() {
        viewModel?.getPokemons {
            let pokemon = self.viewModel?.pokemon(at: 0)
            XCTAssertEqual(pokemon?.name, "Bulbasaur")
        }
    }
}
