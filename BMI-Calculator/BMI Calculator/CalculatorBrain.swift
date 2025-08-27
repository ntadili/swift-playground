//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nasser Tadili Hassani on 24/08/2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        print(height)
        print(weight)
        
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            print("Underweight")
            bmi = BMI(bmiValue: bmiValue, advice: "Maybe eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            print("Normal")
            bmi = BMI(bmiValue: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else{
            print("Overweight")
            bmi = BMI(bmiValue: bmiValue, advice: "Maybe eat less pies!", color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1))
        }
    }
    
    func getBMIValue() -> String {
        let bmiValueToString = String(format: "%.1f", bmi?.bmiValue ?? 0.0)
        return bmiValueToString
    }
}
