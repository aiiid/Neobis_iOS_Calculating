//
//  CalculatorModel.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import Foundation

class CalculatorModel {
    enum Operation {
        case addition, subtraction, multiplication, division
    }
    
    private var currentOperation: Operation?
    private var currentInput: Double = 0
    private var previousInput: Double = 0

    func inputNumber(_ number: Double) {
        currentInput = number
    }

    func setOperation(_ operation: Operation) {
        previousInput = currentInput
        currentOperation = operation
        currentInput = 0
    }

    func calculate() -> Double? {
        guard let operation = currentOperation else { return nil }

        let result: Double
        switch operation {
        case .addition:
            result = previousInput + currentInput
        case .subtraction:
            result = previousInput - currentInput
        case .multiplication:
            result = previousInput * currentInput
        case .division:
            result = previousInput / currentInput
        }
        
        currentOperation = nil
        currentInput = result
        return result
    }

    func clear() {
        currentOperation = nil
        currentInput = 0
        previousInput = 0
    }
}
