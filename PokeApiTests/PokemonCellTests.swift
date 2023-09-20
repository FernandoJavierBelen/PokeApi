//
//  PokemonCellTests.swift
//  PokeApiTests
//
//  Created by Fernando Belen on 19/09/2023.
//

import Quick
import Nimble
@testable import PokeApi

class PokemonCellSpec: QuickSpec {
    override func spec() {
        describe("PokemonCell") {
            var cell: PokemonCell!

            beforeEach {
                cell = PokemonCell(style: .default, reuseIdentifier: "Cell")
            }

            afterEach {
                cell = nil
            }

            context("when configuring the cell") {
                it("should set the label text correctly") {
                    let pokemonName = "squirtle"
                    cell.configureCell(with: pokemonName)
                    expect(cell.labelName.text).to(equal(pokemonName))
                }
            }
        }
    }
}
