//
//  TipCalculation.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 16/01/25.
//

import Foundation
import SwiftData

@Model
class TipCalculation: Identifiable {
    var id = UUID()
    var checkAmount: Double
    var tipPercentage: Int
    var numberOfPeople: Int
    var tipTotal: Double
    var grandTotal: Double
    var tipPerPerson: Double
    var totalPerPerson: Double
    var date: Date

    init(
        checkAmount: Double,
        tipPercentage: Int,
        numberOfPeople: Int,
        tipTotal: Double,
        grandTotal: Double,
        tipPerPerson: Double,
        totalPerPerson: Double,
        date: Date = Date()
    ) {
        self.checkAmount = checkAmount
        self.tipPercentage = tipPercentage
        self.numberOfPeople = numberOfPeople
        self.tipTotal = tipTotal
        self.grandTotal = grandTotal
        self.tipPerPerson = tipPerPerson
        self.totalPerPerson = totalPerPerson
        self.date = date
    }
}
