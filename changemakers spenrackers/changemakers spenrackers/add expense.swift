//
//  add expense.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//

import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var vm: Budget
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var amount = ""
    @State private var category: Category = .food
    @State private var type: ExpenseType = .need

    var body: some View {
        VStack(spacing: 20) {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            Picker("Category", selection: $category) {
                ForEach(Category.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.menu)

            Picker("Type", selection: $type) {
                Text("Need").tag(ExpenseType.need)
                Text("Want").tag(ExpenseType.want)
            }
            .pickerStyle(.segmented)

            Button("Add Expense") {
                let value = Double(amount) ?? 0
                vm.addExpense(name: name, amount: value, category: category, type: type)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
