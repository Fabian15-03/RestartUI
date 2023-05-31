//
//  Home.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 28/05/23.
//

import SwiftUI

struct Home: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = false
    @State private var isAnimating: Bool = false
    
    var body: some View {
        VStack{
                // Center
            Spacer()
            
            ZStack{
                    CircleGroup(ShapeColor: .gray, ShapeOpacity: 0.1)
                    Image("character-2").resizable().scaledToFit().padding()
                    .offset(y: isAnimating ? 20 : -20)
                    .animation(.easeOut(duration: 4).repeatForever(), value: isAnimating)
                }
            Text("The time that leads to mastery is dependent on the intensity our focus")
                .font(.title3).foregroundColor(.gray)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.horizontal , 20)
            
            Spacer()
            
            Button {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                Text("Restart").font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent).buttonBorderShape(.capsule)
            .controlSize(.large)

            
        } // VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isAnimating = true
            }
        })
        .preferredColorScheme(.dark)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
