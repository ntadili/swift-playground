//
//  WeatherManager.swift
//  Clima
//
//  Created by Nasser Tadili Hassani on 28/08/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=82b2de900da7908cb03169623c31c868&units=metric"
    
    func fetchWeather(city: String) {
        let urlString = weatherURL + "&q=\(city)"
        performRequest(urlString: urlString)    }
    
    func performRequest(urlString: String) {
        // Step 1. Create URL
        if let url = URL(string: urlString) {
            // Step 2. Create URLSession
            let session = URLSession(configuration: .default)

            // Step 3. Give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }

            // Step 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            //            print(decodedData.weather[0].description)
            //            print("Wind speed: ",decodedData.wind.speed)
            
            let weather = WeatherModel(weatherId: id, cityName: cityName, temperature: temp)
            print(weather.conditionName)
            print(weather.temperatureString)
        } catch {
            print(error)
        }
    }
    
}
