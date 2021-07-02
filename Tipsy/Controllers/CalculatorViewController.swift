//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage = 0.10
    var numberOfPeople = 2
    var total = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let stringButtonTitle = String(buttonTitle.dropLast())
        let doubleButtonTitle = Double(stringButtonTitle)!
        tipPercentage = doubleButtonTitle / 100
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let bill = billTextField.text!
        guard let doubleBill = Double(bill) else { return }
        let totalBill = doubleBill * (1 + tipPercentage) / Double(numberOfPeople)
        total = String(format: "%.2f", totalBill)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.split = numberOfPeople
            destinationVC.tip = tipPercentage
            destinationVC.total = total
        }
    }
    
}

