//
//  home.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: Budget

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Balance: \(vm.balance, specifier: "%.2f")")
                    .font(.title)

                Text("Saving Goal: \(vm.savingGoal, specifier: "%.2f")")
                Text("Spent: \(vm.totalSpent, specifier: "%.2f")")
                Text("Left (no saving): \(vm.remainingWithoutSaving, specifier: "%.2f")")
                    .foregroundColor(.gray)

                Text("Left this month: \(vm.remainingThisMonth, specifier: "%.2f")")
                    .font(.headline)

                NavigationLink("Add Expense") {
                    AddExpenseView(vm: vm)
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Should I Buy This") {
                    ShouldIBuyView(vm: vm)
                }

                NavigationLink("Summary") {
                    SummaryView(vm: vm)
                }

                List {
                    ForEach(vm.expenses) { expense in
                        VStack(alignment: .leading) {
                            Text(expense.name)
                                .font(.headline)

                            Text("\(expense.category.rawValue) • \(expense.type.rawValue.capitalized)")

                            Text("\(expense.amount, specifier: "%.2f")")
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .padding()
        }
    }
}
