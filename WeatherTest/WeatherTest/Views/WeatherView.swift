//
//  WeatherView.swift
//  WeatherTest
//
//  Created by Mateo Restrepo on 6/30/22.
//

import SwiftUI


struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
    
        ZStack(alignment: .leading) {
            
            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.636, saturation: 0.36, brightness: 0.99),
            Color(hue: 0.636, saturation: 0.566, brightness: 0.9),
            Color(hue: 0.656, saturation: 0.787, brightness: 0.7654)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.top)
            
            
       //     Circle()
       //         .frame(width: 150, height: 150)
       //         .foregroundColor(Color.yellow.opacity(0.2))
       //         .offset(x: 50, y: -60)
       //     Circle()
       //         .frame(width: 150, height: 150)
       //         .foregroundColor(Color.yellow.opacity(0.2))
       //         .offset(x: 70, y: -60)
       //     Rectangle()
       //         .frame(width: 250, height: 150)
       //         .foregroundColor(Color.yellow.opacity(0.2))
       //         .offset(x: 70, y: -80)
       //     Color.white.opacity(0.35)
                .edgesIgnoringSafeArea(.top)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                .blur(radius: 2)
            
            
            
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                        .padding(.top)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 50))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y:7)
                        
                        Spacer()
                        VStack(spacing: 0) {
                            Text("Feels Like:")
                                .font(.system(size: 30).bold())
                                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                            .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                        }
            //            Text(weather.main.min1.roundDouble() + "°")
             //               .font(.system(size: 70))
             //               .offset(x: 10)
                    }
                    
                    Spacer()
                        .frame(height:  0)
                    
             //       AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
         //               image
         //                   .resizable()
          //                  .aspectRatio(contentMode: .fit)
          //                  .frame(width: 350)
            //        } placeholder: {
            //           ProgressView()
               //     }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Current Weather")
                        .bold()
                        .padding(.leading)
                        .font(.system(size: 25))
                        
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                            .frame(width: 180, alignment: .leading)
                            
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                            .frame(width: 140, alignment: .leading)
                            .padding(.leading)
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            .frame(width: 180, alignment: .leading)
                            
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                            .frame(width: 140, alignment: .leading)
                            .padding(.leading)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                
                .padding()
                .padding(.bottom, 20)
               // .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .foregroundColor(Color.white)
                .background(.black.opacity(0.4))
                .preferredColorScheme(.dark)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        
        .preferredColorScheme(.dark)
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        
        WeatherView(weather: previewWeather)
        }
    }

