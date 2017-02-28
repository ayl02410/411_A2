//
//  ViewController.swift
//  BMI_Calc
//
//  Alex Liao
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let userData: User = User.shared
    //MARK: Properties
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var unitToggle: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var gaugeView: gaugeView!
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.delegate = self
        heightTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == weightTextField {
            userData.weight = Double(textField.text!)!
        }
        else {
            userData.height = Double(textField.text!)!
        }
    }
    
    
    //MARK: Actions
    @IBAction func calculateButton(_ sender: UIButton) {
        
        userData.doubleHeight()
        userData.setBmiValue()
        gaugeView.base = Int(userData.bmiValue)
        bmiLabel.text = String(userData.bmiValue)
        resultLabel.text = "\(userData.bmiValue)"
        
        
        switch userData.bmiValue
        {
            case 0..<userData.underWeightCutOff:
                if userData.bmiValue < 16.00 {
                    resultLabel.text = "Severe Thiness"
                }
                else if userData.bmiValue >= 16.00 && userData.bmiValue < 17.00 {
                    resultLabel.text = "Moderate Thiness"
                }
                else {
                    resultLabel.text = "Mild Thiness"
                }
            case userData.underWeightCutOff..<userData.normalRangeCutOff:
                resultLabel.text = "Normal"
            case userData.normalRangeCutOff..<userData.overWeightCutOff:
                resultLabel.text = "Overweight: Pre-obese"
            case userData.overWeightCutOff...userData.obese:
                if userData.bmiValue < 35 {
                resultLabel.text = "Obese class I"
                }
                else if userData.bmiValue >= 35 && userData.bmiValue < userData.obese {
                    resultLabel.text = "Obese class II"
                }
                else {
                    resultLabel.text = "Obese class III"
                }
            default:
                resultLabel.text = "Invalid BMI value: weight & height values cannot be negative"
        }
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        if !sender.isOn {
            userData.unitConverter()
            userData.doubleHeight()
        }
        else {
            userData.doubleHeight()
        }
    }
    

}

