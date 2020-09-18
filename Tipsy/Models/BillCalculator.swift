//
//  BillCalculator.swift
//  Tipsy
//
//  Created by Ezequiel Parada Beltran on 18/09/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct BillCalculator {
    var bill: Bill?
    
    func calculateAmountPerPerson(total: Float, numberOfPeople: Int, tip: Float) -> Double{
        guard let tot = bill?.total, let _ = bill?.numberOfPeople, let tip = bill?.tip else {
            return 0
        }
        return Double((tot + (tip * tot)) / Float(numberOfPeople))
    }
}
