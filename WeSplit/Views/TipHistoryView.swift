//
//  TipHistoryView.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 16/01/25.
//

import SwiftUI
import SwiftData

struct TipHistoryView: View {
    @Query private var calculations: [TipCalculation]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            List {
                ForEach(calculations) { calculation in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Date:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(calculation.date, style: .date)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("Time:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(calculation.date, style: .time)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        HStack {
                            Text("Check Amount:")
                            Spacer()
                            Text(calculation.checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }

                        HStack {
                            Text("Tip Percentage:")
                            Spacer()
                            Text("\(calculation.tipPercentage)%")
                        }

                        HStack {
                            Text("Tip Total:")
                            Spacer()
                            Text(calculation.tipTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }

                        HStack {
                            Text("Grand Total:")
                            Spacer()
                            Text(calculation.grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }

                        HStack {
                            Text("Tip Per Person:")
                            Spacer()
                            Text(calculation.tipPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }

                        HStack {
                            Text("Total Per Person:")
                            Spacer()
                            Text(calculation.totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: deleteCalculations)
            }
            .navigationTitle("History")
            .toolbar {
                EditButton()
            }
        }
    }

    private func deleteCalculations(at offsets: IndexSet) {
        for index in offsets {
            let calculation = calculations[index]
            modelContext.delete(calculation)
        }
    }
}

#Preview {
    TipHistoryView()
}
