//
//  TipCalculator.swift
//  Tippy
//
//  Created by Joseph Bouhanef on 2019-12-12.
//  Copyright © 2019 Joseph Bouhanef. All rights reserved.
//

import Foundation

class TipCalculator {
    var billAmount: Double = 0
    var tipAmount:Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(billAmount: Double, tipPercentage: Double) {
        self.billAmount = billAmount
        self.tipPercentage = tipPercentage
    }
}

extension TipCalculator {
    func calculateTip() {
        tipAmount = billAmount * tipPercentage
        totalAmount = tipAmount + billAmount
    }
}
