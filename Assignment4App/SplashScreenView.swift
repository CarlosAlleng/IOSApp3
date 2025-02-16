
//  SplashScreenView.swift
//  Assignment4App
//
//  Created by Carlos Alleng on 2025-02-15.
//


import SwiftUI

struct SplashScreenView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isRegistering = false
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack {
                   // Background Image
                   Image("login")
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .edgesIgnoringSafeArea(.all)
                       .opacity(0.3)
                     
            
            ScrollView {
                VStack(spacing: 25) {
                    Text("CITYWIDE")
                        .font(.custom("Didot-Bold", size: 40))
                        .foregroundColor(.black)
                    
                    Text("SCAVENGER HUNT")
                        .font(.custom("Didot-Bold", size: 35))
                        .foregroundColor(.black)
                    
                    VStack(spacing: 20) {
                        if isRegistering {
                            TextField("Username", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .padding(.horizontal, 50)
                        }
                        
                        TextField("Email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal, 50)
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 50)
                        
                        Button(action: {
                            if isRegistering {
                                _ = userManager.register(username: username, email: email, password: password)
                            } else {
                                _ = userManager.login(email: email, password: password)
                            }
                        }) {
                            Text(isRegistering ? "Register" : "Login")
                                .font(.custom("Futura-Medium", size: 18))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color.blue)
                                .cornerRadius(25)
                        }

                       .padding(.horizontal, 50)
                        
                        Button(action: { isRegistering.toggle() }) {
                            Text(isRegistering ? "Already have an account? Login" : "Need an account? Register")
                                .font(.custom("Futura-Medium", size: 16))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.vertical, 30)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20)
                    .shadow(radius: 10)
                }
                .padding()
            }
        }
        .alert(isPresented: $userManager.showError) {
            Alert(
                title: Text("Error"),
                message: Text(userManager.errorMessage),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
