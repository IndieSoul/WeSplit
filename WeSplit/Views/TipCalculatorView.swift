//
//  TipCalculatorView.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 16/01/25.
//

import SwiftUI

struct TipCalculatorView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = TipCalculatorViewModel()

    @FocusState private var amountIsFocused: Bool

    var body: some View {
        NavigationStack {
            Form {
                // Input Section
                Section {
                    TextField(
                        "Enter Amount", value: $viewModel.checkAmount,
                        format: .currency(code: viewModel.selectedCurrency)
                    )
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)

                    Picker("Number of People", selection: $viewModel.numberOfPeople) {
                        ForEach(1..<100) { Text("\($0 - 1) people") }
                    }

                    Picker("Currency", selection: $viewModel.selectedCurrency) {
                        ForEach(viewModel.currencies, id: \.self) { Text($0) }
                    }
                }

                // Tip Selection
                Section("Tip Percentage") {
                    Picker("Tip Percentage", selection: $viewModel.tipPercentage) {
                        ForEach(0...100, id: \.self) { Text("\($0)%") }
                    }
                }

                // Totals Section
                Section("Totals") {
                    HStack {
                        Text("Tip Total")
                        Spacer()
                        Text(viewModel.totalTip, format: .currency(code: viewModel.selectedCurrency))
                    }

                    HStack {
                        Text("Grand Total")
                        Spacer()
                        Text(viewModel.grandTotal, format: .currency(code: viewModel.selectedCurrency))
                    }
                }

                // Per Person Amounts
                Section("Amount Per Person") {
                    HStack {
                        Text("Base Amount Per Person")
                        Spacer()
                        Text(viewModel.baseAmountPerPerson, format: .currency(code: viewModel.selectedCurrency))
                    }

                    HStack {
                        Text("Tip Per Person")
                        Spacer()
                        Text(viewModel.tipPerPerson, format: .currency(code: viewModel.selectedCurrency))
                    }

                    HStack {
                        Text("Total Per Person")
                        Spacer()
                        Text(viewModel.amountPerPerson, format: .currency(code: viewModel.selectedCurrency))
                    }
                }

                // Save Button
                Button("Save Calculation") {
                    viewModel.saveCalculation(modelContext: modelContext)
                }
                .disabled(viewModel.checkAmount <= 0)
            }
            .navigationTitle("We Split")
            .toolbar {
                if amountIsFocused {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
            .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

#Preview {
    TipCalculatorView()
}
