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
    
    var textInput: String {billTextField.text ?? ""}
    var tipAmount: Float?
    var splitNumber: Double?
    var calculatedAmount: Float?
    
    @IBAction func tipChanged(_ sender: UIButton) {
        [zeroPctButton, tenPctButton, twentyPctButton].forEach{$0?.isSelected = false}
        sender.isSelected = true
        billTextField.endEditing(true)
        
        if sender == zeroPctButton {
            tipAmount = 0.0
        } else if sender == tenPctButton {
            tipAmount = 0.1
        } else if sender == twentyPctButton {
            tipAmount = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = (sender.value)
        splitNumberLabel.text = String(format: "%.0f", splitNumber ?? 2)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Cost amount: ", Float(textInput) ?? 0)
        print("Tip amount: ", tipAmount ?? 0.1)
        print("Split number: ", splitNumber ?? 2)
        calculateSplit()
        
    }
    
    func calculateSplit() {
        let tipAmountCalculated = (tipAmount ?? 0.1) * (Float(textInput) ?? 0)
        calculatedAmount = ((Float(textInput) ?? 0) + tipAmountCalculated) / Float(splitNumber ?? 2)
        print("Each one will have to pay: ", calculatedAmount!)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedBill = calculatedAmount ?? 0
            destinationVC.splitNumber = String(format: "%.0f", splitNumber ?? 2.0)
            destinationVC.tipAmount = tipAmount ?? 0.1
        }
    }
}

