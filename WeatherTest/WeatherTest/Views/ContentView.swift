//
//  ContentView.swift
//  WeatherTest
//
//  Created by Mateo Restrepo on 6/30/22.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.636, saturation: 0.36, brightness: 0.99),
            Color(hue: 0.636, saturation: 0.566, brightness: 0.9),
            Color(hue: 0.656, saturation: 0.787, brightness: 0.7654)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .preferredColorScheme(.dark)
            .edgesIgnoringSafeArea(.top)
            
            RoundedRectangle(cornerRadius:25)
                .fill(.white)
                .opacity(0.1)
                .background(
                    Color.white
                    .opacity(0.08)
                    .blur(radius: 90))
                .frame(width: 350, height: 340, alignment: .center)
                .offset(x:0, y: 10)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
        
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
       }
        .preferredColorScheme(.dark)
        }
        
    }
    }
        
 //   }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
