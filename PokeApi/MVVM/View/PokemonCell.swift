//
//  PokemonCell.swift
//  PokeApi
//
//  Created by Fernando Belen on 01/09/2023.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy() {
        addSubview(labelName)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: topAnchor),
            labelName.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            labelName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureCell(with name: String?) {
        labelName.text = name
    }
}
