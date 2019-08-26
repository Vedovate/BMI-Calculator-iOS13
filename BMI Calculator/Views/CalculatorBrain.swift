//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Leonardo Vedovate on 08/10/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    mutating func CalculateBmi(height: Float, weight: Float) {
        let bmiValue = Float(weight / (pow(height, 2)))
        bmi = BMI(value: bmiValue, advice: BringResults(bmiValue: bmiValue), color: BringColors(bmiValue: bmiValue))
    }
    
    mutating func BringResults(bmiValue: Float) -> String{
        switch bmiValue{
        case 0..<18.5:
            return "Eat more pies!"
        case 18.5...24.9:
            return "Fit as a fiddle!"
        case let value where value > 24.9:
            return "Eat less pies!"
        default:
            return ""
        }
    }
    
    mutating func BringColors(bmiValue: Float) -> UIColor{
        let colors = [ #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1) , #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)  , #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)]
        
        switch bmiValue{
        case 0..<18.5:
            return colors[2]
        case 18.5...24.9:
            return colors[1]
        case let value where value > 24.9:
            return colors[0]
        default:
            return colors[0]
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    func getBMIValue() -> String{
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
}
