//
//  ContentView.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 28/05/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    var body: some View {
        ZStack{
            if isOnboardingActive {
                Onboarding()
            } else {
                Home()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
