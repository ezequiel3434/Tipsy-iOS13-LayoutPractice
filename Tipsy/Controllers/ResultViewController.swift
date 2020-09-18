//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ezequiel Parada Beltran on 18/09/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill: Bill?
    var amountPP = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        guard (bill != nil) else {
            return
        }
        settingsLabel.text = "Split between \(bill!.numberOfPeople) people, with \(bill!.tip) tip."
        totalLabel.text = amountPP
    }
   

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
