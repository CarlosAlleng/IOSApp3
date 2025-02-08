//
//  Assignment4AppApp.swift
//  Assignment4App
//
//  Created by Carlos Alleng on 2025-02-06.



import SwiftUI

struct ContentView: View {
    let clues = [
        "Find the pond with a bridge in gairloch gardens.",
        "Look for Oakville's First Post Office.",
        "Locate Oakville lighthouse.",
        "Oakville Clock Tower near Towne Square.",
        "The Gazebo in Lakeside Park.",
        "The bakery known for its legendary croissants.",
        "Find Aveiro Bakery.",
        "Oakville Museum at Erchless Estate.",
        "Take a selfie with a Mural or Street Art in Downtown Oakville.",
        "Grab a Book from Different Drummer Books."
    ]
    
    @State private var foundItems: Set<Int> = []
    @State private var selectedImage: UIImage? = nil
    
    var discountMessage: String {
        switch foundItems.count {
        case 7...9:
            return "20% Discount Code: LOCAL20"
        case 5...6:
            return "10% Discount Code: LOCAL10"
        case 10:
            return "20% Discount Code: LOCAL20\nYou're entered into the $5000 draw!"
        default:
            return "No discount yet."
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.white]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HStack {
                        NavigationLink(destination: ImageView()) {
                            Image(systemName: "photo.stack.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue.opacity(0.5))
                                .clipShape(Circle())
                        }
                        .padding(.leading)
                        
                        Spacer()
                    }
                    
                    Text("CITYWIDE SCAVENGER HUNT")
                        .font(.custom("Didot-Bold", size: 35))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    Text("Find items, take photos, and win discounts!")
                        .font(.custom("Optima-Regular", size: 18))
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(clues.indices, id: \.self) { index in
                                VStack {
                                    Text(clues[index])
                                        .font(.custom("Optima-Regular", size: 16))
                                        .multilineTextAlignment(.center)
                                        .padding()
                                        .frame(width: 300)
                                    
                                    Button(action: {
                                        foundItems.insert(index)
                                    }) {
                                        Text(foundItems.contains(index) ? "✅ Found!" : "Take Photo")
                                            .font(.custom("Futura-Medium", size: 16))
                                            .foregroundColor(.white)
                                            .frame(width: 250)
                                            .frame(height: 50)
                                            .background(foundItems.contains(index) ? Color.green : Color.blue)
                                            .cornerRadius(25)
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 250)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Results Submitted: \(foundItems.count) items found.")
                    }) {
                        Text("Submit Results")
                            .font(.custom("Futura-Medium", size: 18))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.orange)
                            .cornerRadius(25)
                    }
                    .padding(.horizontal)
                    
                    Text(discountMessage)
                        .font(.custom("Didot-Bold", size: 20))
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(15)
                        .padding(.bottom)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
