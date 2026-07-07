//
//  ContentView.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 30/06/2026.
//
import SwiftUI

struct ContentView: View {
    @StateObject var vm = Budget()

    var body: some View {
        if !vm.hasSetup {
            SetupView(vm: vm)
        } else if vm.needsMonthlyIncomeInput {
            MonthlyIncomeView(vm: vm)
        } else {
            HomeView(vm: vm)
        }
    }
}
