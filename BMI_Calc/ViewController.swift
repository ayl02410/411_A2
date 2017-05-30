//
//  ViewController.swift
//  BMI_Calc
//
//  Alex Liao
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//MARK: Properties
    let userData: User = User.shared
    let gauge = GaugeView.shared
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var unitToggle: UISwitch!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var gaugeView: GaugeView!
    
    @IBOutlet weak var calcButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.delegate = self
        heightTextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tap)
        
        updateButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        calcButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField
        {
        	case weightTextField:
                userData.weight = Double(textField.text!) ?? 0.0
        	default:
                userData.height = Double(textField.text!) ?? 0.0
        }
        updateButtonState()
    }
    
    
    //MARK: Actions
    @IBAction func calculateButton(_ sender: UIButton) {
        userData.calculateBMI()
        
        gaugeView.counter = Int(userData.bmiValue!)
        
        bmiLabel.text = String(describing: userData.bmiValue!)
        
        resultLabel.text = userData.userCategory
        
        calcButton.isEnabled = false
    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        if !sender.isOn {
            userData.inMetric = false
        }
        else {
            userData.inMetric = true
        }
    }
    

//MARK: Private Methods
    func updateButtonState() {
        let weight = weightTextField.text ?? ""
        let height = heightTextField.text ?? ""
        calcButton.isEnabled = !weight.isEmpty && !height.isEmpty
    }
    func tapped() {
        view.endEditing(true)
    }
}

/*
    iOS updates the context by calling drawRect(_:) whenever the view needs to be updated. 
    This happens when:
        The view is new to the screen.
        Other views on top of it are moved.
        The view’s hidden property is changed.
        Your app explicitly calls the setNeedsDisplay() or setNeedsDisplayInRect() methods on the view.
*/







