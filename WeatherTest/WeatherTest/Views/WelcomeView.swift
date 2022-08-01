//
//  WelcomeView.swift
//  WeatherTest
//
//  Created by Mateo Restrepo on 6/30/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                
                Text("Please share your current location to get the weather in your area")
                    .padding()
                    .shadow(color: Color.black.opacity(0.7), radius: 10, x: 0, y:10)
            }
            .multilineTextAlignment(.center)
            .padding()

            
            // LocationButton from CoreLocationUI framework imported above, allows us to requestionLocation
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
