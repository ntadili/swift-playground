//
//  WeatherData.swift
//  Clima
//
//  Created by Nasser Tadili Hassani on 31/08/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Wind: Codable {
    let speed: Float
}


