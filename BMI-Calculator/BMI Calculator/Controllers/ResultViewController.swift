//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Nasser Tadili Hassani on 23/08/2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiResultLabel: UILabel!
    
    @IBOutlet weak var bmiSuggestionLabel: UILabel!
        
    @IBOutlet var bmiBackgroundColor: UIView!
    
    var bmiValue: String?
    var bmiAdvice: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResultLabel.text = bmiValue
        bmiSuggestionLabel.text = bmiAdvice
        bmiBackgroundColor.backgroundColor = bmiColor
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
