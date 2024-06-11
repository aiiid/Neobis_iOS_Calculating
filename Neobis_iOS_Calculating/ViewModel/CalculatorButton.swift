//
//  CalculatorButtons.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 11/06/2024.
//

import UIKit

enum CalculatorButton {
    case allClear
    case plusMinus
    case percentage
    case divide
    case multiply
    case subtract
    case add
    case equals
    case number(Int)
    case decimal
}

extension CalculatorButton {
    var title: String {
        switch self {
        case .allClear:
            return "AC"
        case .plusMinus:
            return "+/-"
        case .percentage:
            return "%"
        case .divide:
            return "÷"
        case .multiply:
            return "x"
        case .subtract:
            return "-"
        case .add:
            return "+"
        case .equals:
            return "="
        case .number(let int):
            return int.description
        case .decimal:
            return "."
        }
    }
    
    var color: UIColor {
        switch self {
        case .allClear, .plusMinus, .percentage:
            return .lightGray
            
        case .divide, .multiply, .subtract, .add, .equals:
            return .systemOrange
            
        case .number, .decimal:
            return .darkGray
        }
    }
    
    var selectedColor: UIColor? {
        switch self {
        case .allClear, .plusMinus, .percentage, .equals, .number, .decimal:
            return nil
            
        case .divide, .multiply, .subtract, .add:
            return .white
        }
    }
    
    var textColor: UIColor{
        switch self {
        case .allClear, .plusMinus, .percentage:
            return .black
        default:
            return .white
        }
        
    }
}
