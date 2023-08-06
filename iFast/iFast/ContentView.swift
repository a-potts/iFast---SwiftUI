//
//  ContentView.swift
//  iFast
//
//  Created by Austin Potts on 8/6/23.
//

import SwiftUI

struct ContentView: View {
    
  @StateObject var fastingManager = FastingManager()
    //state object means it will follow the life cycle of this view, we could have used obersvable object but that invalidates the view & recreates it with every update, if state doesnt work then use obersavle
    
    var title: String {
        switch fastingManager.fastingState {
            
        case .notStarted:
            return "Let's Get Started!"
        case .fasting:
            return "You are now fasting!"
        case .feeding:
            return "You are now feeding!"
        }
    }
    
    
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
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1)))
                
                //MARK: Fasting Plan
                Text(fastingManager.fastingPlan.rawValue)
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
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                    //MARK: End Time
                    
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        
                        //16 is for testing
                        Text(fastingManager.endTime.addingTimeInterval(16), format: .dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                }
                
                //MARK: Button
                
                Button {
                    fastingManager.toggleFastingState()
                } label: {
                    Text(fastingManager.fastingState == .fasting ? "End Fasting" : "Start Fasting")
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
