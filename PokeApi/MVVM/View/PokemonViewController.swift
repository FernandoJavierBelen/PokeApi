//
//  PokemonViewController.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import UIKit

class PokemonViewController: UIViewController {
    
    private var viewModel = PokemonViewModel()
    private var dataSource: PokemonDataSource?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .black
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.getPokemons { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupView() {
        addViewHierarchy()
        addConstraints()
        additionalConf()
        setupTableView()
    }
    
    func additionalConf() {
        view.backgroundColor = .white
        title = String.pokemonTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupTableView() {
        dataSource = PokemonDataSource(viewModel: viewModel)
        tableView.dataSource = dataSource
        tableView.register(PokemonCell.self, forCellReuseIdentifier: String.pokemonCellIdentifier)
    }
}