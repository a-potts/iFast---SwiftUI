//
//  ProgressRing.swift
//  iFast
//
//  Created by Austin Potts on 8/6/23.
//

import SwiftUI

struct ProgressRing: View {
    
    @EnvironmentObject var fastingManager: FastingManager
   
    
    //MARK: Timer Publisher - works in pair with the unrecieved modifier henever the publsiher sends the npotification every 1 second we will start tracking the timer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            //MARK: Placeholder Ring
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            
            //MARK: Colored Ring
            
            Circle()
                .trim(from: 0.0,  to: min(fastingManager.progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.6163027883, blue: 0.9745588899, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.2752215266, blue: 0.9569992423, alpha: 1)), Color(#colorLiteral(red: 0.3230270147, green: 0.3595308065, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.07639981061, green: 0.9389412403, blue: 1, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
            
                //Animation Modifier for top ring
                .animation(.easeInOut(duration: 1.0), value: fastingManager.progress)
            
            VStack(spacing: 30) {
                if fastingManager.fastingState == .notStarted {
                    VStack(spacing: 5){
                        
                        //MARK: Upcoming Time
                        Text("Upcoming Fast")
                            .opacity(0.7)
                        
                        Text("\(fastingManager.fastingPlan.fastingPeriod.formatted()) Hours")
                            .fontWeight(.bold)
                            .font(.title)
                            

                    }
                } else {
                    //MARK: Elapsed Time
                    
                    VStack(spacing: 5){
                        
                        Text("Elapsed Time (\(fastingManager.progress.formatted(.percent)))")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime, style: .timer)
                            .fontWeight(.bold)
                            .font(.title)
                            

                    }
                    .padding(.top)
                    
                    
                    
                    
                    //MARK: Remaining Time
                    
                    VStack(spacing: 5){
                        
                        if !fastingManager.elapsed {
                            Text("Remaining (\((1 - fastingManager.progress).formatted(.percent)))")
                                .opacity(0.7)
                        } else {
                            Text("Extra Time")
                                .opacity(0.7)
                        }
                        
                       
                        
                        Text(fastingManager.endTime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)

                        
                       
                        
                    }

                }
                
            }
            
            
                
        }
        .frame(width: 250, height: 250)
        .padding()
//        .onAppear {
//            fastingManager.progress = 1
//
//        }
        //MARK: Publisher Timer Pt 2
        .onReceive(timer) { _ in
            fastingManager.track()
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
            .environmentObject(FastingManager())
    }
}
