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
            //Mark: BAckground
            Color(#colorLiteral(red: 0.03348137066, green: 0.0009218981722, blue: 0.0571668148, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        VStack {
            //MARK: Progress ring
            ProgressRing()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
