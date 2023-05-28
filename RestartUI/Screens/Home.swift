//
//  Home.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 28/05/23.
//

import SwiftUI

struct Home: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = false
    
    var body: some View {
        VStack (spacing: 20){
            Text("Home!").font(.largeTitle)
            Button(action: {
                isOnboardingActive = true
            }) {
                Text("Restart")
            }
        } // VSTACK
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
