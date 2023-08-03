//
//  MainTableViewCell.swift
//  Pet-project
//
//  Created by Никита Тюрин on 01.08.23.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    private let flagLabel = FlagLabel()
    private let nameLabel = NameLabel()
    private lazy var stackView = UIStackView(arrangedSubviews: [flagLabel, nameLabel],
                                             axis: .horizontal,
                                             spacing: 8)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cell")   
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(object: Element) {
        self.flagLabel.text = object.flag
        self.nameLabel.text = object.name
        
    }
    
    func configure() {
        
        contentView.addSubview(stackView)
        backgroundColor = #colorLiteral(red: 0.7015956044, green: 0.7902155519, blue: 0.9298793674, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstrainsForViewInCell() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
