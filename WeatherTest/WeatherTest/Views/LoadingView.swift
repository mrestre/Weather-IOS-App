//
//  LoadingView.swift
//  WeatherTest
//
//  Created by Mateo Restrepo on 6/30/22.
//

import SwiftUI
//@State private var value = 0

struct LoadingView: View {
    
 //   @State private var progress = 0
    
    var body: some View {
    //    let progress: Double = 0
      
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color(hue: 0.636, saturation: 0.36, brightness: 0.99),
            Color(hue: 0.636, saturation: 0.566, brightness: 0.9),
            Color(hue: 0.656, saturation: 0.787, brightness: 0.7654)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.top)
            
            
            
         //   LinearGradient(gradient: Gradient(colors: [Color(hue: 0.736, saturation: 0.86, brightness: 0.42),
       //     Color(hue: 0.836, saturation: 0.866, brightness: 0.42),
       //     Color(hue: 0.656, saturation: 0.587, brightness: 0.454)]), startPoint: .topLeading, endPoint: .bottom)
            
            VStack( spacing: 0) {
            
            Text("Loading Weather Data")
                .font(.system(size: 35).bold())
             //   .padding(.bottom)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .padding()
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
                
            
            
            Spacer()
          //      @State private var value = 0.0
      //          ProgressView("Please wait...", value: progress, total: 100)
       //             .accentColor(.gray)
      //              .foregroundColor(.blue)
      //              .padding()
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(maxWidth: .infinity, maxHeight: 100, alignment: .top)
        }
            .preferredColorScheme(.dark)
           // .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            
            RoundedRectangle(cornerRadius:25)
                .fill(.white)
                .opacity(0.2)
                .background(
                    Color.white
                    .opacity(0.08)
                    .blur(radius: 90))
                .frame(width: 260, height: 300, alignment: .center)
                .offset(x:0, y: -60)
                .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y:10)
            
            Image("imageIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .offset(x: 0, y: -120)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.3)
                .frame(width: 150, height: 13)
                .offset(x: 30, y: -20)
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.3)
                .frame(width: 150, height: 13)
                .offset(x: 30, y: 10)
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.3)
                .frame(width: 150, height: 13)
                .offset(x: 30, y: 40)
            Circle()
                .fill(.white)
                .opacity(0.3)
                .frame(width: 50, height: 50)
                .offset(x: -90, y: 10)
    }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()

    }
}

