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
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        backgroundColor = .systemPink
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(displayLabel)
        
        let buttonTitles = [
            ["C", "8", "%", "/"],
            ["4", "5", "6", "*"],
            ["1", "2", "3", "-"],
            ["0", "C", "=", "+"],
            ["0", "C", ".", "="]
        ]
        
        for row in buttonTitles{
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for title in row {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                rowStackView.addArrangedSubview(button)
            }
            mainStackView.addArrangedSubview(rowStackView)
        }
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        viewModel.handleInput(title)
        updateDisplay()
    }
    
    func updateDisplay(){
        displayLabel.text = viewModel.displayText
    }
}
