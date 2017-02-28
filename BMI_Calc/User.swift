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
    var weight: Double = 0.0
    var height: Double = 0.0
    var bmiValue: Double = 0.0
    var underWeightCutOff = 18.50
    var normalRangeCutOff = 25.00
    var overWeightCutOff = 30.00
    var obese = 90.00
    
    static let shared: User = User()
    
    
    //MARK: Methods
    func doubleHeight() {
        height /= 100
        height *= height
    }
    
    func unitConverter() {
        weight *= 0.4536
        height *= 30.48
    }
    func setBmiValue() {
        bmiValue = weight / height
        bmiValue = (bmiValue * 1000).rounded() / 1000
    }
}
