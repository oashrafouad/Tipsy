//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Omar Ashraf on 03/07/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = "hello"
    var tipPercentage: Float = 0.0
    var numberOfPeople = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(String(format: "%.0f", tipPercentage * 100))% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
}
