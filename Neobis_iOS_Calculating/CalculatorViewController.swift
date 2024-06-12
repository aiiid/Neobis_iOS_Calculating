//
//  CalculatorViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Ai Hawok on 10/06/2024.
//

import UIKit

class CalculatorViewController: UIViewController {
    private var viewModel = CalculatorViewModel()
    private var calculatorView: CalculatorView!
    
    override func loadView() {
        calculatorView = CalculatorView(frame: UIScreen.main.bounds)
        calculatorView.viewModel = viewModel
        view = calculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
