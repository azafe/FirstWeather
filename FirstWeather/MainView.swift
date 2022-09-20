//
//  ContentView.swift
//  FirstWeather
//
//  Created by Fernando Zafe on 14/09/2022.
//

import SwiftUI

struct MainView: View {
    
    
    @StateObject var weatherModel: WeatherViewModel = WeatherViewModel()
    
    @State private var isNight:Bool = false
    
    @State private var cityInput: String = ""
    
    var body: some View {
        ZStack{
            BackgroundView(isNiht: $isNight)
            
            VStack{
                NameCityView(cityName: weatherModel.weather?.name ?? " - ")
                MainWeatherStatus(imageName: isNight ? "moon.fill" : "sun.max.fill", temperature: "\(Int(weatherModel.weather?.main.temp ?? 0))", description: weatherModel.weather?.weather[0].description ?? " - "  )
                HStack(spacing:40){
                        WeatherDayView(day: "JUE", imageName: "cloud.sun.fill", temperature: "23")
                        WeatherDayView(day: "VIE", imageName: "sun.max.fill", temperature: "22")
                        WeatherDayView(day: "SAB", imageName: "cloud.fill", temperature: "14")
                        WeatherDayView(day: "DOM", imageName: "cloud.sun.fill", temperature: "16")
                        WeatherDayView(day: "LUN", imageName: "cloud.fill", temperature: "20")
                    }
                    Spacer()
                
                Button("Pulsame"){
                }
                Button{
                    isNight.toggle()
                }label:{WeatherButton(title: "Cambiar Día/Noche",
                                      textColor: .blue,
                                      backgroundColor: .white)
                    
            }
                Form {
                    TextField(text: $cityInput, prompt: Text("Required")) {
                        Text("Username")
                    }
                }
                Spacer()

            }
        }
        .onAppear{
            weatherModel.executeAPI()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(weatherModel:  WeatherViewModel())
    }
}



struct WeatherDayView: View{
    var day: String
    var imageName: String
    var temperature: String
        
    var body: some View{
        VStack(spacing: 10){
            Text(day)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName).renderingMode(.original)
            Text(temperature)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}


struct BackgroundView: View {
    @Binding var isNiht: Bool
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [isNiht ? .black : .blue, isNiht ? .gray : Color("lightBlue")]), startPoint:.topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}


struct NameCityView: View{
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 26, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatus: View{
    var imageName: String
    var temperature: String
    var description: String
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
            Text(description)
                .foregroundColor(.white)
                .padding(.top)
            Text("\(temperature) ºC")
                .font(.system(size: 70, weight: .bold, design: .default))
                .foregroundColor(.white)
                .padding(.bottom, 10)
            
        }
    }
}


struct WeatherButton: View{
    var title:String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
