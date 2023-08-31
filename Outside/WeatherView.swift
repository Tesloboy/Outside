//  WeatherView.swift
//  Outside
//
//  Created by Viktor Teslenko on 31.08.2023.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue,Color.white]), startPoint: .topLeading, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(
            VStack {
                Text(viewModel.cityName)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                Text(viewModel.temperature)
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.white)
                Text(viewModel.weatherIcon)
                    .font(.system(size: 100))
                Text(viewModel.weatherDescription)
                    .foregroundColor(.white)
                    .bold()
            }
                .padding(.bottom, 60)
            .alert(isPresented: $viewModel.shouldShowLocationError) {
                Alert(
                    title: Text("Error"),
                    message: Text("To see the weather, provide location access in Settings."),
                    dismissButton: .default(Text("Open Settings")) {
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                        UIApplication.shared.open(settingsURL)
                    }
                )
            }
            .onAppear(perform: viewModel.refresh)
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherViewModel(weatherService: WeatherService()))
    }
}
