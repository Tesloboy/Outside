//
//  LaunchScreenView.swift
//  Outside
//
//  Created by Viktor Teslenko on 31.08.2023.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
  "Drizzle" : "🌧",
  "Thunderstorm" : "⛈",
  "Rain": "🌧",
  "Snow": "❄️",
  "Clear": "☀️",
  "Clouds" : "☁️",
]

class WeatherViewModel: ObservableObject {
  @Published var cityName: String = "City Name"
  @Published var temperature: String = "--"
  @Published var weatherDescription: String = "--"
  @Published var weatherIcon: String = defaultIcon
  @Published var shouldShowLocationError: Bool = false

  public let weatherService: WeatherService

  init(weatherService: WeatherService) {
    self.weatherService = weatherService
  }

    func refresh() {
        weatherService.loadWeatherData { weather, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error loading weather data: \(error)")
                    self.shouldShowLocationError = true
                    return
                }

                self.shouldShowLocationError = false
                guard let weather = weather else {
                    print("No weather data received")
                    return
                }
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
                print("Weather data loaded successfully")
            }
        }
    }
    
}
