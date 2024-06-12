//
//  CalculatorModel.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import Foundation

class CalculatorModel {
    enum Operation {
        case addition, substraction, multiplication, division
    }
    
    private var currentOperation: Operation?
    private var currentInput: String = "0"
    private var previousInput: Double = 0
    
    private var operationJustSet = false
    
    func inputNumber(_ number: Int) {
        if operationJustSet {
            currentInput = "\(Int(number))"
            operationJustSet = false
        }
        else {
            if currentInput == "0"{
                currentInput = "\(Int(number))"
            } else {
                currentInput += "\(Int(number))"
            }
        }
        
    }
    
    func setOperation(_ operation: Operation) {
        if let number = Double(currentInput) {
            previousInput = number
            currentOperation = operation
            operationJustSet = true
        }
    }
    
    func calculate() -> Double? {
        guard let operation = currentOperation, let currentNumber = Double(currentInput) else { return nil }
        let result: Double
        switch operation{
        case .addition:
            result = previousInput + currentNumber
        case .substraction:
            result = previousInput - currentNumber
        case .multiplication:
            result = previousInput * currentNumber
        case .division:
            result = previousInput / currentNumber
        }
        currentOperation = nil
        currentInput = "\(result)"
        
        return result
    }
    
    func addDecimal() {
        if !currentInput.contains(".") {
            currentInput += "."
        }
    }
    
    func toggleSign() {
        if currentInput.hasPrefix("-") {
            currentInput.removeFirst()
        } else {
            currentInput = "-" + currentInput
        }
    }
    
    func percentage() {
        guard let currentNumber = Double(currentInput) else { return }
        currentInput = String(currentNumber / 100)
    }
    
    func popLastDigit() {
            currentInput = String(currentInput.dropLast())
            if currentInput.isEmpty || currentInput == "-" {
                currentInput = "0"
            }
        }
    
    func displayNumber() -> String {
        if let doubleValue = Double(currentInput) {
                if doubleValue.truncatingRemainder(dividingBy: 1) == 0 {
                    return String(format: "%.0f", doubleValue)
                } else {
                    return currentInput
                }
            } else {
                return currentInput
            }
    }
    
    func clear() {
        currentOperation = nil
        currentInput = "0"
        previousInput = 0
    }
}
