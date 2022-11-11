//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maher on 10/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false

    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(CityName: "Cupertino, CA")
                
             
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperture: 76)
                
                HStack(spacing: 20){
                    WeatherDayView(
                    dayOfWeek: "TUE",
                    imageName: "cloud.sun.fill",
                    temperture: 74
                    )
                    WeatherDayView(
                    dayOfWeek: "WED",
                    imageName: "sun.max.fill",
                    temperture: 88
                    )

                    WeatherDayView(
                    dayOfWeek: "THU",
                    imageName: "wind.snow",
                    temperture: 55
                    )

                    WeatherDayView(
                    dayOfWeek: "FRI",
                    imageName: "sunset.fill",
                    temperture: 60
                    )

                    WeatherDayView(
                    dayOfWeek: "SAT",
                    imageName: "snow",
                    temperture: 25
                    )
                }
                Spacer()
                Button{
                    print("Tapped")
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change day time", textColor: .blue, backgroundColor: .white)                }
                Spacer()
                
                 
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperture: Int
    
    var body: some View {
            VStack{
                Text("\(dayOfWeek)")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                Image(systemName: "\(imageName)")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40,height: 40)
                
                Text("\(temperture)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var CityName: String
    var body: some View {
        Text(CityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var imageName: String
    var temperture: Int
    
    var body: some View {
        VStack(spacing: 8){
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180, height: 180)
                
                Text("\(temperture)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
            }
        .padding(.bottom,40)
    }
}
