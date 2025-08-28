//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nasser Tadili Hassani on 26/08/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedBill: Float?
    var tipAmount: Float?
    var splitNumber: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(calculatedBill!)
        tipAmount = tipAmount! * 100
        totalLabel.text = String(calculatedBill ?? 0.0)
        settingsLabel.text = "Split between \(splitNumber!) people with \(String(format: "%.0f", tipAmount!))% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
