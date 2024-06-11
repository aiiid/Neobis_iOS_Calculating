//
//  CalculatorButton.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 11/06/2024.
//
import UIKit

class CalculatorButtonView: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
//    // New initializer to set the button type to .system
//        override init(frame: CGRect, buttonType: UIButton.ButtonType) {
//            super.init(frame: frame)
//            self.buttonType = buttonType
//            commonInit()
//        }
//    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        layer.cornerRadius = 40
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func configure(with button: CalculatorButton) {
        setTitle(button.title, for: .normal)
        
        backgroundColor = button.color
        setTitleColor(button.textColor, for: .normal)
    }
}
