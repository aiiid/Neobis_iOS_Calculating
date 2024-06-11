//
//  CalculatorViewModel.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import Foundation

class CalculatorViewModel {
    private let model = CalculatorModel()
    
    var displayText = "0"
    
    func handleInput(_ input: String){
        if let number = Int(input) {
            inputNumber(number)
        } else {
            switch input {
            case "+":
                setOperation(.addition)
            case "-":
                setOperation(.substraction)
            case "*":
                setOperation(.multiplication)
            case "/":
                setOperation(.division)
            case "=":
                calculate()
            case "C":
                model.clear()
                displayText = "0"
            default: break
            }
        }
    }
    
    func inputNumber(_ number: Int) {
        let currentNumber = Double(number)
        model.inputNumber(currentNumber)
        displayText = "\(Int(currentNumber))"
    }
    
    func setOperation(_ operation: CalculatorModel.Operation){
        model.setOperation(operation)
    }
    
    func calculate(){
        if let result = model.calculate() {
            displayText = "\(Int(result))"
        }
    }
    
    func clear(){
        model.clear()
        displayText = "0"
    }
    
}
