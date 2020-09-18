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
    
    
    
    mutating func createBill(total: Double, numberOfPeople: Int, tip: String) {
        let tipB = Double(String(tip.replacingOccurrences(of: "%", with: "")))!/100.0
        let amount = Double(Double((total + (tipB * total))) / Double(numberOfPeople))
        
        bill = Bill(tip: tip, total: total, numberOfPeople: numberOfPeople, amounPerPerson: amount)
    }
    
    
//    mutating func calculateAmountPerPerson() {
//        guard let tot = bill?.total, let numberOfPeople = bill?.numberOfPeople, let tip = bill?.tip else {
//            print("hola")
//            return
//        }
//        print("asad")
//
//        bill?.amounPerPerson = Int(Double((tot + (tipB * tot))) / Double(numberOfPeople))
//        print("\(bill?.amounPerPerson)")
//    }
    
    
    
    func getAmountPP() -> String {
        guard let amount = bill?.amounPerPerson else { return "0.0" }
        return String(format: "%.1f", amount)
    }
}
