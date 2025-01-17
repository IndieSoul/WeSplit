//
//  ContentView.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        if hasSeenOnboarding {
            TabView {
                TipCalculatorView()
                    .tabItem {
                        Label("Calculate", systemImage: "dollarsign.circle")
                    }

                TipHistoryView()
                    .tabItem {
                        Label("History", systemImage: "clock")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        } else {
            OnboardingView()
        }
        
    }
}

#Preview {
    ContentView()
}
