//
//  LaunchScreenView.swift
//  Weather
//
//  Created by Viktor Teslenko on 31.08.2023.
//

import SwiftUI

struct CustomLaunchScreen: View {
    var body: some View {
        ZStack {
            Color.blue // Цвет фона
                .ignoresSafeArea()

            VStack {
                Text("🌧") // Значок погоды
                    .font(.system(size: 100))
                Text("Outside") // Текст "Outside"
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .foregroundColor(.white)
        }
    }
}

struct CustomLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomLaunchScreen()
    }
}
