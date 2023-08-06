//
//  ContentView.swift
//  iFast
//
//  Created by Austin Potts on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            //MARK: BAckground
            Color(#colorLiteral(red: 0.03348137066, green: 0.0009218981722, blue: 0.0571668148, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                //MARK: Title
                Text("Let's Get Started!")
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1)))
                
                //MARK: Fasting Plan
                Text("16:8")
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(.thinMaterial)
                    .cornerRadius(20)
                
                Spacer()
                
            }
                
            VStack(spacing: 40) {
                //MARK: Progress ring
                ProgressRing()
                
                
                HStack(spacing: 60) {
                    //MARK: Start Time
                    
                    VStack(spacing: 5) {
                        Text("Start")
                            .opacity(0.7)
                        
                        Text(Date(), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                    //MARK: Start Time
                    
                    VStack(spacing: 5) {
                        Text("End")
                            .opacity(0.7)
                        
                        //16 is for testing
                        Text(Date().addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                
                //MARK: Button
                
                Button {
                    
                } label: {
                    Text("Start Fasting")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }

            }
            
            .padding()
        }
        .foregroundColor(.white)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
