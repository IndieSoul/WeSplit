//
//  TipCalculatorViewModel.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 17/01/25.
//

import SwiftUI
import SwiftData

class TipCalculatorViewModel: ObservableObject {
    @Published var checkAmount: Double = 0.0
    @Published var numberOfPeople: Int = 2
    @Published var tipPercentage: Int = 20
    @Published var selectedCurrency: String = Locale.current.currency?.identifier ?? "USD"

    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""

    func resetFields() {
        checkAmount = 0.0
        numberOfPeople = 2
        tipPercentage = 20
        selectedCurrency = Locale.current.currency?.identifier ?? "USD"
    }

    var totalTip: Double {
        return checkAmount * Double(tipPercentage) / 100
    }

    var grandTotal: Double {
        return checkAmount + totalTip
    }

    var amountPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        guard peopleCount > 0 else { return 0 }
        return grandTotal / peopleCount
    }

    var tipPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        guard peopleCount > 0 else { return 0 }
        return totalTip / peopleCount
    }

    var baseAmountPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        guard peopleCount > 0 else { return 0 }
        return checkAmount / peopleCount
    }

    var currencies: [String] {
        Locale.availableIdentifiers.compactMap { identifier in
            Locale(identifier: identifier).currency?.identifier
        }.sorted()
    }

    func saveCalculation(modelContext: ModelContext) {
        let newCalculation = TipCalculation(
            checkAmount: checkAmount,
            tipPercentage: tipPercentage,
            numberOfPeople: numberOfPeople,
            tipTotal: totalTip,
            grandTotal: grandTotal,
            tipPerPerson: tipPerPerson,
            totalPerPerson: amountPerPerson
        )
        modelContext.insert(newCalculation)
        alertMessage = "Calculation saved successfully!"
        showAlert = true
        resetFields()
    }
}
