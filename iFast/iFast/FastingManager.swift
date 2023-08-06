//
//  FastingManager.swift
//  iFast
//
//  Created by Austin Potts on 8/6/23.
//

import Foundation


// Observable Allows this class to become a publisher & let the dependent views know of any changes in its property

enum FastingState {
    
    case notStarted
    case fasting
    case feeding
    
}

enum FastingPlan: String {
    case beginner = "12:12"
    case intermediate = "16:8"
    case advanced = "20:4"
    
    var fastingPeriod: Double {
        switch self {
            
        case .beginner:
            return 12
        case .intermediate:
            return 16
        case .advanced:
            return 24
        }
    }
    
}


class FastingManager: ObservableObject {
    //private setting only in this class can we edit these values
    @Published private(set) var fastingState: FastingState = .notStarted
    //@published property wrapper the view using this state will be notofied then updated
    
    @Published private(set) var fastingPlan: FastingPlan = .intermediate
    
    @Published private(set) var startTime: Date
    @Published private(set) var endTime: Date
    
    init(){
        let calendar = Calendar.current
        var componenets = calendar.dateComponents([.year, .month, .day, .hour], from: Date())
        componenets.hour = 20 //8 o clock
        print(componenets)
        
        let scheduledTime = calendar.date(from: componenets) ?? Date.now //default to now incase of any issues
        print("Scheduled Time\(scheduledTime)")
        
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.intermediate.fastingPeriod)
    }
    
    func toggleFastingState(){
        fastingState = fastingState == .fasting ? .feeding : .fasting
    }
    
}
