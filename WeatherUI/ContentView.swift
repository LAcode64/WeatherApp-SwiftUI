//
//  ContentView.swift
//  WeatherUI
//
//  Created by TboyAhoy on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
               CityTextView(cityName: "Cupertino, CA")
                
                CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                
                HStack(spacing: 25) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 56)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.rain.fill", temperature: 35)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 32)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.bolt.rain.fill", temperature: 34)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 60)
                    
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    
                }
                
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
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 40, height:40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: Font.Weight.medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("light-blue")]), startPoint: /*@START_MENU_TOKEN@*/.bottomTrailing/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
    }
}

struct CityTextView: View{
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(15)
    }
}

struct CurrentWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 180, height:180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: Font.Weight.medium))
                .foregroundColor(.white)
           
        }.padding(.bottom, 40)
    }
}
