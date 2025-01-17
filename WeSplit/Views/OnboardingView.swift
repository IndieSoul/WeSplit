//
//  OnboardingView.swift
//  WeSplit
//
//  Created by Luis Enrique Rosas Espinoza on 17/01/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        ZStack {
            // Fondo con degradado
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Contenido
            TabView(selection: $currentPage) {
                PageView(
                    imageName: "dollarsign.circle.fill",
                    title: "Welcome to WeSplit",
                    description: "Easily calculate how much each person needs to pay when splitting a bill.",
                    color: .green
                )
                .tag(0)

                PageView(
                    imageName: "percent",
                    title: "Tip Made Simple",
                    description: "Choose the right tip percentage and let us handle the math.",
                    color: .blue
                )
                .tag(1)

                PageView(
                    imageName: "list.bullet.rectangle.portrait.fill",
                    title: "Keep Track",
                    description: "Save and view your past calculations for quick reference.",
                    color: .orange
                )
                .tag(2)

                // Última página con botón para comenzar
                VStack {
                    Spacer()
                    Text("Ready to Split Bills?")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)

                    Button(action: {
                        withAnimation {
                            hasSeenOnboarding = true
                        }
                    }) {
                        Text("Get Started")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.green)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                }
                .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct PageView: View {
    let imageName: String
    let title: String
    let description: String
    let color: Color

    @State private var imageOpacity: Double = 0.0

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // Imagen principal con animación de aparición
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(color)
                .shadow(color: color.opacity(0.6), radius: 10, x: 0, y: 5)
                .opacity(imageOpacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        imageOpacity = 1.0
                    }
                }
                .accessibilityLabel(Text("Illustration: \(title)"))

            // Título
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .accessibilityLabel(Text("Title: \(title)"))

            // Descripción
            Text(description)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .accessibilityLabel(Text("Description: \(description)"))

            Spacer()
        }
    }
}

#Preview {
    OnboardingView()
}
