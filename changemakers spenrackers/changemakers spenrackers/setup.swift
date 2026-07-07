//
//  setup.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//

import SwiftUI

struct SetupView: View {
    @ObservedObject var vm: Budget
    @State private var money = ""
    @State private var monthly = ""
    @State private var saving = ""
    @State private var alreadyAdded = false

    var isValid: Bool {
        Double(money) != nil &&
        Double(monthly) != nil &&
        Double(saving) != nil
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("How much money do you have?")
                .font(.title)

            TextField("Total money", text: $money)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Text("How much did you earn this month?")
                .font(.headline)

            TextField("Monthly income", text: $monthly)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Text("How much do you want to save this month?")
                .font(.headline)

            TextField("Saving goal", text: $saving)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Toggle("I already added this month's money", isOn: $alreadyAdded)

            Button("Continue") {
                let total = Double(money) ?? 0
                let income = Double(monthly) ?? 0
                let goal = Double(saving) ?? 0

                vm.monthlyIncome = income
                vm.savingGoal = goal

                if alreadyAdded {
                    vm.balance = total
                } else {
                    vm.balance = total + income
                }

                vm.hasSetup = true
                vm.needsMonthlyIncomeInput = false
            }
            .buttonStyle(.borderedProminent)
            .disabled(!isValid)
            .opacity(isValid ? 1 : 0.5)
        }
        .padding()
    }
}
