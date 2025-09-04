//
//  WeatherManager.swift
//  Clima
//
//  Created by Nasser Tadili Hassani on 28/08/2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=82b2de900da7908cb03169623c31c868&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(city: String) {
        let urlString = weatherURL + "&q=\(city)"
        performRequest(with: urlString)    }
    
    func performRequest(with urlString: String) {
        // Step 1. Create URL
        if let url = URL(string: urlString) {
            // Step 2. Create URLSession
            let session = URLSession(configuration: .default)

            // Step 3. Give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }

            // Step 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
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
            
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
