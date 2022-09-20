//
//  Models.swift
//  FirstWeather
//
//  Created by Fernando Zafe on 14/09/2022.
//

import Foundation

struct WeatherModel: Codable{
    let name: String
    let main: WeatherInfo
    let weather: [WeatherDescription]
}

struct WeatherInfo: Codable{
    let temp: Float
}

struct WeatherDescription: Codable{
    let description: String
}
