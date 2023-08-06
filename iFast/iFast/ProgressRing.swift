//
//  ProgressRing.swift
//  iFast
//
//  Created by Austin Potts on 8/6/23.
//

import SwiftUI

struct ProgressRing: View {
    
    @EnvironmentObject var fastingManager: FastingManager
    
    @State var progress = 0.0
    var body: some View {
        ZStack {
            //MARK: Placeholder Ring
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            
            //MARK: Colored Ring
            
            Circle()
                .trim(from: 0.0,  to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6163027883, blue: 0.9745588899, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2752215266, blue: 0.9569992423, alpha: 1)), Color(#colorLiteral(red: 0.3230270147, green: 0.3595308065, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
            
                //Animation Modifier for top ring
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            VStack(spacing: 30) {
                //MARK: Elapsed Time
                
                VStack(spacing: 5){
                    Text("Elapsed Time")
                        .font(.title)
                    
                    Text(fastingManager.startTime, style: .timer)
                        .fontWeight(.bold)
                        .opacity(0.7)

                        
                        
                    
                }
                .padding(.top)
                
                //MARK: Elapsed Time
                
                VStack(spacing: 5){
                    
                    Text("Remaining Time")
                        .font(.title2)
                    
                    Text(fastingManager.endTime, style: .timer)
                        .opacity(0.7)
                        .fontWeight(.bold)

                    
                   
                    
                }
            }
            
            
                
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(FastingManager())
    }
}
