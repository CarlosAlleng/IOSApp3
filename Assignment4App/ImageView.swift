//
//  Assignment4AppApp.swift
//  Assignment4App
//
//  Created by Carlos Alleng on 2025-02-06.

import SwiftUI

struct ImageView: View {
    let images = [
        "Im1",
        "Im2",
        "Im3",
        "Im4",
        "Im5",
        "Im6",
        "Im7",
        "Im8"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(images, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .clipped()
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Photos")
        .background(Color.white)
    }
}
