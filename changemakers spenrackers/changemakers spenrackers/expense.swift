//
//  expense.swift
//  changemakers spenrackers
//
//  Created by Luis Alejandro Vargas Sia on 01/07/2026.
//
import Foundation

enum ExpenseType: String, Codable {
    case need
    case want
}

enum Category: String, CaseIterable, Codable {
    case food = "Food"
    case clothes = "Clothes"
    case home = "Home Necessities"
    case hobby = "Hobby"
    case work = "Work"
    case other = "Other"
}

struct Expense: Identifiable, Codable {
    let id: UUID
    let name: String
    let amount: Double
    let category: Category
    let type: ExpenseType

    init(id: UUID = UUID(), name: String, amount: Double, category: Category, type: ExpenseType) {
        self.id = id
        self.name = name
        self.amount = amount
        self.category = category
        self.type = type
    }
}
