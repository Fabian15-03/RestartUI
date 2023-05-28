//
//  Onboarding.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 28/05/23.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    var body: some View {
        VStack (spacing: 20){
            Text("Onboarding!").font(.largeTitle)
            Button(action: {
                isOnboardingActive = false
            }) {
                Text("Start")
            }
        } // VSTACK
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
