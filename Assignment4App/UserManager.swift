//
//  UserManager.swift
//  Assignment4App
//
//  Created by Carlos Alleng on 2025-02-13.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: UUID = UUID()
    var username: String
    var email: String
    var password: String
}

class UserManager: ObservableObject {
    @Published var users: [User] = []
    @Published var currentUser: User? = nil
    @Published var showError = false
    @Published var errorMessage = ""
    
    private let userDefaultsKey = "savedUsers"
    
    init() {
        loadUsers()
    }
    
    func loadUsers() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([User].self, from: savedData) {
            users = decoded
        }
    }
    
    func saveUsers() {
        if let encoded = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    func register(username: String, email: String, password: String) -> Bool {
        guard !username.isEmpty && !email.isEmpty && !password.isEmpty else {
            errorMessage = "All fields are required"
            showError = true
            return false
        }
        
        if users.contains(where: { $0.email == email }) {
            errorMessage = "Email already exists"
            showError = true
            return false
        }
        
        let newUser = User(username: username, email: email, password: password)
        users.append(newUser)
        saveUsers()
        currentUser = newUser
        return true
    }
    
    func login(email: String, password: String) -> Bool {
        if let user = users.first(where: { $0.email == email && $0.password == password }) {
            currentUser = user
            return true
        }
        errorMessage = "Invalid email or password"
        showError = true
        return false
    }
}


