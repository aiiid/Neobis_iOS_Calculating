//
//  CalculatorView.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import UIKit

class CalculatorView: UIView {
    var viewModel: CalculatorViewModel!

    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Additional buttons can be added here similarly

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white  // Set background color
        
        addSubview(displayLabel)
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            displayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            displayLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // Setup additional buttons similarly with constraints
    }
    
    func updateDisplay() {
        displayLabel.text = viewModel.displayText
    }
}
