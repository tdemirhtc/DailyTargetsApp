//
//  GoalViewModel.swift
//  DailyTargetsApp
//
//  Created by Hatice Taşdemir on 15.11.2024.
//

import Foundation
import SwiftUI

class GoalViewModel: ObservableObject {
    
    
    // Hedef listesini yayınlayarak View'de otomatik güncellenmesini sağlıyoruz
    @Published var goals: [Goal] = [
        Goal(name: "Kitap Oku", description: "Günde 30 sayfa kitap oku", progress: 0.5),
        Goal(name: "Spor Yap", description: "Günde 10.000 adım at", progress: 0.7)
    ]

    // Yeni hedef ekleme fonksiyonu
    func addGoal(name: String, description: String) {
        let newGoal = Goal(name: name, description: description, progress: 0.0)
        goals.append(newGoal)
    }

    // Hedefin ilerleme oranını güncelleme fonksiyonu
    func updateProgress(for goalID: UUID, newProgress: Double) {
        if let index = goals.firstIndex(where: { $0.id == goalID }) {
            goals[index].progress = newProgress
        }
    }
}
