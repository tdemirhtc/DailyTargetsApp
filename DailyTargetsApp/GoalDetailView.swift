//
//  GoalDetailView.swift
//  DailyTargetsApp
//
//  Created by Hatice Taşdemir on 15.11.2024.
//

import SwiftUI

struct GoalDetailView: View {
    
    
    var goal: Goal
    @ObservedObject var viewModel: GoalViewModel
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        VStack(spacing: 20) {
            Text(goal.name)
                .font(.largeTitle)
                .bold()
            
            Text(goal.description)
                .padding()
            
            Gauge(value: goal.progress, in: 0...1) {
                Text("\(Int(goal.progress * 100))% Tamamlandı")
            }
            .gaugeStyle(.accessoryCircular)
            .frame(width: 100, height: 100)
            
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } else {
                Button("Fotoğraf Ekle") {
                    showImagePicker = true
                }
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(selectedImage: $selectedImage)
        }
    }
}






