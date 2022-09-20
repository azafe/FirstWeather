//
//  ViewModel.swift
//  FirstWeather
//
//  Created by Fernando Zafe on 14/09/2022.
//

import Foundation


final class WeatherViewModel: ObservableObject{
    
    @Published var weather: WeatherModel?
    
    func executeAPI(){
        
        let urlSession =  URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=-26.8303703&lon=-65.2038133&appid=26ed5e84c48c1adf8d1556f3cf651270&units=metric")
        
        urlSession.dataTask(with: url!) { data, response, error in
            guard let data = data else{ return}
                if let decodedData = try? JSONDecoder().decode(WeatherModel.self, from: data){
                    DispatchQueue.main.async {
                        self.weather = decodedData
                    }
                }
                
        }.resume()
        }
}

