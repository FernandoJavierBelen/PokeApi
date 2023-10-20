//
//  AppCoordinator.swift
//  PokeApi
//
//  Created by Fernando Belen on 20/10/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { set get }
    func start()
}

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    func start() {
        let viewController = PokemonViewController()
        viewController.view.backgroundColor = .white
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(viewController, animated: true)
    }
}
