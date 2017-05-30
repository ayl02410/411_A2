//
//  User.swift
//  BMI_Calc
//
//  Created by CampusUser on 2/27/17.
//  Copyright © 2017 CampusUser. All rights reserved.
//

import UIKit

class User {
    
//MARK: Properties
    var weight: Double?
    var height: Double?
    var bmiValue: Double?
    var userCategory: String?
    var inMetric = true
    
    static let shared: User = User()
    
    
//MARK: Methods
    func calculateBMI() {
        var inHeight = height!
        var inWeight = weight!
        
        if !inMetric    // Values in imperial format
        {
            if 10 > inHeight  {
                // height in feet, convert to inches
                inHeight *= 12
            }
            // convert to meters
            inHeight *= 0.025
            
            // convert to kilograms
            inWeight *= 0.45
        }
        else {          // Values in metric format
            if 50 < inHeight {
                // height in centimeters, convert to meters
                inHeight /= 100
            }
            if 1000 < inWeight {
                // weight in grams, convert to kilograms
                inWeight /= 1000
            }
        }
        bmiValue = inWeight / (inHeight * inHeight)
        bmiValue = (bmiValue! * 1000).rounded() / 1000
        
        switch bmiValue! {
        	case -100..<0:
            	userCategory = "Invalid values entered!"
            case 0..<16:
                userCategory = "Severe Thiness"
            case 16.0..<17:
                userCategory = "Moderate Thiness"
            case 17..<18.50:
                userCategory = "Mild Thiness"
            case 18.50..<25:
                userCategory = "Normal"
            case 25..<30:
                userCategory = "Overweight"
            case 30..<35:
                userCategory = "Obese class I"
            case 35..<40:
                userCategory = "Obese class II"
            default:
                userCategory = "Obese class III"
        }
    }
}














