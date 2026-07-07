//
//  monthly.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//

import SwiftUI

struct MonthlyIncomeView: View {
    @ObservedObject var vm: Budget
    @State private var income = ""
    @State private var saving = ""

    var isValid: Bool {
        Double(income) != nil && Double(saving) != nil
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("New Month")
                .font(.largeTitle)

            Text("How much did you earn this month?")
                .font(.headline)

            TextField("Monthly income", text: $income)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Text("How much do you want to save this month?")
                .font(.headline)

            TextField("Saving goal", text: $saving)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Button("Start Month") {
                let newIncome = Double(income) ?? 0
                let newSaving = Double(saving) ?? 0

                vm.balance += newIncome
                vm.resetMonth(newIncome: newIncome)
                vm.savingGoal = newSaving
                vm.needsMonthlyIncomeInput = false
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isValid)
            .opacity(isValid ? 1 : 0.5)
        }
        .padding()
    }
}
