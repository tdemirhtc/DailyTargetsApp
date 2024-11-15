//
//  ContentView.swift
//  DailyTargetsApp
//
//  Created by Hatice Taşdemir on 15.11.2024.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var viewModel = GoalViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.goals) { goal in
                NavigationLink(destination: GoalDetailView(goal: goal, viewModel: viewModel)) {
                    HStack {
                        Image(systemName: goal.imageName ?? "star")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        Text(goal.name)
                        Spacer()
                        Gauge(value: goal.progress, in: 0...1) {
                            Text("")
                        }
                        .gaugeStyle(.accessoryCircular)
                        .frame(width: 30, height: 30)
                    }
                    
                }
            }
            .navigationTitle("Hedeflerin")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Hedef Ekle") {
                        viewModel.addGoal(name: "Yeni Hedef", description: "Yeni hedef açıklaması")
                    }
                }
            }
        }
    }
}



#Preview {
    ContentView()
}
