//
//  CalculatorViewModel.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import Foundation

class CalculatorViewModel {
    private let model = CalculatorModel()
    
    var displayText: String = "0"

    func inputNumber(_ number: Int) {
        let currentNumber = Double(number)
        model.inputNumber(currentNumber)
        displayText = "\(Int(currentNumber))"
    }

    func setOperation(_ operation: CalculatorModel.Operation) {
        model.setOperation(operation)
        displayText = "0"
    }

    func calculate() {
        if let result = model.calculate() {
            displayText = "\(result)"
        }
    }

    func clear() {
        model.clear()
        displayText = "0"
    }
}
