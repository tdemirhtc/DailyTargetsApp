//
//  Goals.swift
//  DailyTargetsApp
//
//  Created by Hatice Taşdemir on 15.11.2024.
//

import Foundation


struct Goal: Identifiable {
    let id: UUID
    var name: String
    var description: String
    var progress: Double
    var imageName: String?
    
    init(name: String, description: String, progress: Double, imageName: String? = nil) {
        self.id = UUID()
        self.name = name
        self.description = description
        self.progress = progress
        self.imageName = imageName
    }
}
