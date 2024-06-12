//
//  CalculatorViewModel.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import Foundation

class CalculatorViewModel {
    private let model = CalculatorModel()
    
    var displayText: String {
        return model.displayNumber()
    }
    
    let buttons: [[CalculatorButton]] = [
        [.allClear, .plusMinus, .percentage, .divide],
        [ .number(7), .number(8), .number(9), .multiply],
        [ .number(4), .number(5), .number(6), .subtract],
        [.number(1), .number(2), .number(3), .add],
        [.number(0), .decimal, .equals]
    ]
    
    func handleInput(_ input: String){
        if let number = Double(input) {
            //            if let number = Int(n)
            model.inputNumber(Int(number))
        } else {
            switch input {
            case "+":
                model.setOperation(.addition)
            case "-":
                model.setOperation(.substraction)
            case "×":
                model.setOperation(.multiplication)
            case "÷":
                model.setOperation(.division)
            case "=":
                _ = model.calculate()
            case ".":
                model.addDecimal()
            case "+/-":
                model.toggleSign()
            case "%":
                model.percentage()
            case "AC":
                model.clear()
            default: break
            }
        }
    }
    
    func handleSwipeLeft(){
        model.popLastDigit()
    }
}
