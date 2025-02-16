//
//  Assignment4AppApp.swift
//  Assignment4App
//
//  Created by Carlos Alleng on 2025-02-06.



import SwiftUI

@main
struct Assignment4App: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            if userManager.currentUser != nil {
                ContentView()
                    .environmentObject(userManager)
            } else {
                SplashScreenView()
                    .environmentObject(userManager)
            }
        }
    }
}
