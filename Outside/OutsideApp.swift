//
//  WeatherApp.swift
//  Outside
//

import SwiftUI

@main
struct OutsideApp: App {
  var body: some Scene {
    WindowGroup {
      let weatherService = WeatherService()
        WeatherView(viewModel: WeatherViewModel(weatherService: weatherService))
    }
  }
}
