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
    var pct=String()
    var numOfPeaple = 2
    var billBrain = BillCalculator()
    let numberToolbar: UIToolbar = UIToolbar()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberToolbar.barStyle = .black
        numberToolbar.items=[
            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(hoopla)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(boopla))
        ]

        numberToolbar.sizeToFit()

        billTextField.inputAccessoryView = numberToolbar //do it for every relevant textfield if there are more than one
    }
    
    @objc func boopla () {
        billTextField.resignFirstResponder()
    }

    @objc func hoopla () {
        billTextField.text=""
        billTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let pctButtons = [zeroPctButton,tenPctButton,twentyPctButton]
        sender.isSelected = true
        for item in pctButtons {
            if item != sender {
                item?.isSelected = false
                
            }
        }
        pct = sender.titleLabel!.text!
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numOfPeaple = Int(sender.value)
        splitNumberLabel.text = String(numOfPeaple)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let pctButtons = [zeroPctButton,tenPctButton,twentyPctButton]
        
        guard billTextField.text != "" else {
            showAlert()
            return
        }
        
        
        let tota = Double( String(billTextField.text!)  )
        
        for btnTip in pctButtons {
            if btnTip!.isSelected {
                pct = btnTip!.titleLabel!.text!
            }
        }
        
        billBrain.createBill(total: tota!, numberOfPeople: numOfPeaple, tip: pct)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bill = billBrain.bill
            
            destinationVC.amountPP = billBrain.getAmountPP()
        }
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Empty Field", message: "Please check the fields", preferredStyle: .alert)
        let alertAct = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAct)
        present(alertController,animated: true)
    }
}

