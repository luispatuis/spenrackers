//
//  shouldibuy.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 04/07/2026.
//
import SwiftUI

struct ShouldIBuyView: View {
    @ObservedObject var vm: Budget
    @State private var price = ""
    @State private var needLevel = 3
    @State private var result = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Should I Buy This?")
                .font(.title)

            TextField("Item price", text: $price)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)

            VStack {
                Text("How much do you need it?")
                Text("\(needLevel)")
                Slider(value: Binding(
                    get: { Double(needLevel) },
                    set: { needLevel = Int($0) }
                ), in: 1...5, step: 1)
            }

            Button("Check") {
                let value = Double(price) ?? 0
                let remaining = vm.remainingThisMonth

                if value <= remaining * 0.1 {
                    result = "Yes, you can buy it"
                } else if value > remaining {
                    result = "No, don't buy it"
                } else {
                    if needLevel >= 4 {
                        result = "You need it, so it's okay"
                    } else if needLevel == 3 {
                        result = "Think about it"
                    } else {
                        result = "You don't really need it"
                    }
                }
            }
            .buttonStyle(.borderedProminent)

            if !result.isEmpty {
                Text(result)
                    .font(.title2)
                    .bold()
            }
        }
        .padding()
    }
}
