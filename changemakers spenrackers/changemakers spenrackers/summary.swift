//
//  summary.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//
import SwiftUI

struct SummaryView: View {
    @ObservedObject var vm: Budget

    var needsTotal: Double {
        vm.expenses.filter { $0.type == .need }.reduce(0) { $0 + $1.amount }
    }

    var wantsTotal: Double {
        vm.expenses.filter { $0.type == .want }.reduce(0) { $0 + $1.amount }
    }

    var total: Double {
        needsTotal + wantsTotal
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Total Spent: \(vm.totalSpent, specifier: "%.2f")")
            Text("Remaining: \(vm.remainingThisMonth, specifier: "%.2f")")

            if total > 0 {
                Text("Needs: \(needsTotal / total * 100, specifier: "%.0f")%")
                Text("Wants: \(wantsTotal / total * 100, specifier: "%.0f")%")
            }
        }
        .padding()
    }
}

