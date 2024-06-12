//
//  CalculatorView.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import UIKit

class CalculatorView: UIView {
    var viewModel: CalculatorViewModel! {
           didSet {
               setupView()
               setupGestureRecognizer()
           }
       }
    
    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(displayLabel)
        
        let buttons = viewModel.buttons
        
        for (rowIndex, row) in buttons.enumerated() {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.spacing = 10
            rowStackView.distribution = .fillEqually
            
            for item in row {
                let buttonView = CalculatorButtonView(frame: .zero)
                buttonView.configure(with: item)
                buttonView.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                rowStackView.addArrangedSubview(buttonView)
                buttonView.heightAnchor.constraint(equalToConstant: 80).isActive = true
                
                if rowIndex == buttons.count - 1 && item.title == "0" {
                    buttonView.widthAnchor.constraint(
                        equalTo: rowStackView.widthAnchor,
                        multiplier: 2/4,
                        constant: -10
                    ).isActive = true
                } else if rowIndex == buttons.count - 1 {
                    buttonView.widthAnchor.constraint(
                        equalTo: rowStackView.widthAnchor,
                        multiplier: 1/4,
                        constant: -5
                    ).isActive = true
                }
            }
            mainStackView.addArrangedSubview(rowStackView)
        }
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
    }
    
    private func setupGestureRecognizer() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwiped(_:)))
        leftSwipe.direction = .left
        addGestureRecognizer(leftSwipe)
    }
    
    @objc private func leftSwiped(_ gesture: UISwipeGestureRecognizer) {
        print("leftSwiped")
        viewModel.handleSwipeLeft()
        updateDisplay()
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        print(title)
        viewModel.handleInput(title)
        updateDisplay()
    }
    
    func updateDisplay(){
        displayLabel.text = viewModel.displayText
    }
}
