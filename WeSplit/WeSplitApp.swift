//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI
import SwiftData

@main
struct WeSplitApp: App {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @AppStorage("theme") private var theme = "System"
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(getColorScheme())
                .modelContainer(for: [TipCalculation.self])
        }
    }
    
    private func getColorScheme() -> ColorScheme? {
        switch theme {
        case "Light":
            return .light
        case "Dark":
            return .dark
        default:
            return nil
        }
    }
}
