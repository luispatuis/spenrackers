//
//  budget.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 01/07/2026.
//
import Foundation
import Combine

class Budget: ObservableObject {
    @Published var balance: Double = 0
    @Published var monthlyIncome: Double = 0
    @Published var savingGoal: Double = 0
    @Published var expenses: [Expense] = []
    @Published var hasSetup: Bool = false
    @Published var needsMonthlyIncomeInput: Bool = true // ✅ start true

    var totalSpent: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    var remainingWithoutSaving: Double {
        monthlyIncome - totalSpent
    }

    var remainingThisMonth: Double {
        monthlyIncome - savingGoal - totalSpent
    }

    func addExpense(name: String, amount: Double, category: Category, type: ExpenseType) {
        let expense = Expense(name: name, amount: amount, category: category, type: type)
        expenses.append(expense)
        balance -= amount
    }

    func resetMonth(newIncome: Double) {
        monthlyIncome = newIncome
        expenses.removeAll()
    }
}
