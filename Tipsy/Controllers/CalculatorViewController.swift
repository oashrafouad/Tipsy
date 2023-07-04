//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Omar Ashraf on 03/07/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    var billAmount: Float = 0.0
    var tipPercentage: Float = 0.1
    var numberOfPeople = 2
    var result: Float = 0.0
    var resultTo2DecimalPlaces: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.isEnabled = false
    }
    
    // Dismiss the keyboard when tapping anywhere outside the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        billTextField.endEditing(true)
    }

    @IBAction func tipChanged(_ sender: UIButton) {

//        zeroPctButton.isSelected = false
//        tenPctButton.isSelected = false
//        twentyPctButton.isSelected = false
//        sender.isSelected = true
        
        zeroPctButton.isSelected = (sender == zeroPctButton)
        tenPctButton.isSelected = (sender == tenPctButton)
        twentyPctButton.isSelected = (sender == twentyPctButton)
        
        // Drop the "%" from the end of the button title string, convert to Float, then divide by 100
        tipPercentage = Float(sender.currentTitle!.dropLast())! / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumberLabel.text = String(numberOfPeople)
    }
    
    @IBAction func billTextFieldChanged(_ sender: UITextField) {
        print("text field changed")
        if billTextField.text?.isEmpty == true
        {
            calculateButton.isEnabled = false
        }
        else
        {
            calculateButton.isEnabled = true
        }
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Float(billTextField.text!)!
        
        result = billAmount * (1 + tipPercentage) / Float(numberOfPeople)
        resultTo2DecimalPlaces = String(format: "%.2f", result)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let resultVC = segue.destination as! ResultViewController
            resultVC.result = resultTo2DecimalPlaces
            resultVC.numberOfPeople = numberOfPeople
            resultVC.tipPercentage = tipPercentage
            
        }
    }
}
