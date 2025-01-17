//
//  SettingsView.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 17/01/25.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @AppStorage("theme") private var theme = "System" // Default: System theme
    @Environment(\.colorScheme) private var colorScheme // Detecta el esquema actual
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $theme) {
                        Text("Light").tag("Light")
                        Text("Dark").tag("Dark")
                        Text("System").tag("System")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: theme) {
                        updateColorScheme()
                    }
                    .accessibilityLabel("Theme selection")
                    .accessibilityHint("Choose between Light, Dark, or System themes")
                }
            }
            .navigationTitle("Settings")
            .background(Color(UIColor.systemBackground)) // Ajusta dinámicamente
        }
        .preferredColorScheme(resolveColorScheme())
    }
    
    private func updateColorScheme() {
        UIWindow.appearance().overrideUserInterfaceStyle = resolveColorScheme() == .dark ? .dark : .light
    }
    
    private func resolveColorScheme() -> ColorScheme? {
        switch theme {
        case "Light":
            return .light
        case "Dark":
            return .dark
        default:
            return nil // Usa el esquema del sistema
        }
    }
}

#Preview {
    SettingsView()
}
