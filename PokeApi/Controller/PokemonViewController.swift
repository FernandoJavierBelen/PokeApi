//
//  PokemonViewController.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import UIKit

class PokemonViewController: UIViewController {
    
    var pokemon = [Results]()
    var httpClient = PokemonHttp()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        httpClient.getPokemons { data in
            self.pokemon = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupView() {
        addViewHerarchy()
        addConstraints()
        addProperties()
    }
    
    func addViewHerarchy() {
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func addProperties() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: "PokemonCell")
    }
}

extension PokemonViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.pokemon = pokemon[indexPath.row]
        return cell
    }
}

extension PokemonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
}
