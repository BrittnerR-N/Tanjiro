//
//  FlagLabel.swift
//  Pet-project
//
//  Created by Никита Тюрин on 02.08.23.
//

import Foundation
import UIKit

class FlagLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
