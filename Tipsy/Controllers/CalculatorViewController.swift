//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var pct=Float()
    var numOfPeaple = 0
    
   

    @IBAction func tipChanged(_ sender: UIButton) {
        let pctButtons = [zeroPctButton,tenPctButton,twentyPctButton]
        sender.isSelected = true
        for item in pctButtons {
            if item != sender {
                item?.isSelected = false
                
            }
        }
        pct = Float(String(describing: sender.titleLabel!.text!.replacingOccurrences(of: "%", with: "")))!/100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numOfPeaple = Int(sender.value)
        splitNumberLabel.text = String(numOfPeaple)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("\(pct) was selected")
        print(numOfPeaple)
    }
}

