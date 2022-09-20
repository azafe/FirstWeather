//
//  InitialView.swift
//  FirstWeather
//
//  Created by Fernando Zafe on 19/09/2022.
//

import SwiftUI

extension View {
        func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    }

struct InitialView: View {
    
    @State private var isNight:Bool = false
    @State var textValue: String = ""
    
    private var cityList: [WeatherCardView] = [WeatherCardView(cityName: "Quebec", temp: "9", image: "cloud.fill"),WeatherCardView(cityName: "Miami", temp: "24", image: "sun.haze.fill"),WeatherCardView(cityName: "London", temp: "6", image: "moon.fill")]
    var body: some View {
        ZStack{
            BackgroundView(isNiht: $isNight)
            VStack {
                SearchBar(textValue: $textValue)
                ScrollView {
                    ForEach(cityList){ city in
                        city
                            .padding(.top,10)
                    }
                }
                Spacer()
                
            }
                Spacer()
                

            }
            
        }
    }


struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
    




struct WeatherCardView: View, Identifiable{
    var id:UUID = UUID()
    var cityName:String
    var temp: String
    var image: String
    var body: some View{
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [.blue,Color("lightBlue")], startPoint: .topLeading, endPoint: .topLeading))
                .frame(width: 350, height: 120)
                .cornerRadius(20)
                .shadow(radius: 2)
                .overlay(alignment: .topLeading){
                    HStack {
                        VStack(alignment: .leading, spacing: 30){
                            Text(cityName)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor(.white)
                            Text("\(temp)º C")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                        }
                        .padding()
                        Spacer()
                        Image(systemName: image).renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60,alignment: .trailing)
                                .padding()
                    }
                }
        }
    }
    
    
    
}

   

struct SearchBar: View {
    @Binding var textValue: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Agregar ciudad", text: $textValue)
            }
            .foregroundColor(.white)
            .padding(.leading,13)
        }
        .frame( height: 40)
        .cornerRadius(13)
        .padding()
    }
}
