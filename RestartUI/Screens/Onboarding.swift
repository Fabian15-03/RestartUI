//
//  Onboarding.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 28/05/23.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("onboarding") var isOnboardingActive : Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOfset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var ImageOfset: CGSize =  .zero
    @State private var indicatorOpacity : Double =  1.0
    @State private var textTitle : String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack{
            Color("ColorBlue").ignoresSafeArea(.all , edges : .all)
            VStack (spacing: 20){
                // Header
                Spacer()
                VStack (spacing: 0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("It's not how much we give but how much love we put into giving.")
                    .font(.title3).foregroundColor(.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal , 40)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0 : -40)
                .animation(.easeOut(duration : 1) , value: isAnimating)
                // Center
                ZStack{
                    CircleGroup(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: ImageOfset.width * -1)
                        .blur(radius: abs( ImageOfset.width / 5))
                        .animation(.easeOut(duration : 1) , value: ImageOfset)
                        
                    
                    
                    
                    Image("character-1").resizable().scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration : 0.5) , value: isAnimating)
                        .offset(x: ImageOfset.width * 1.2 , y: 0)
                        .rotationEffect(.degrees(Double(ImageOfset.width / 20)))
                        .gesture(DragGesture()
                            .onChanged{ gesture in
                                if abs(ImageOfset.width) <= 150 {
                                    ImageOfset = gesture.translation
                                    
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = .zero
                                        textTitle = "Give."
                                    }
                                }
                                    
                            }
                            .onEnded { _ in
                                ImageOfset = .zero
                                withAnimation(.linear(duration: 0.25)){
                                    indicatorOpacity = 1
                                    textTitle = "Share."
                                }
                            }
                        )
                        .animation(.easeOut(duration: 1), value: ImageOfset)
                }
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 30)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration : 1).delay(2) , value: isAnimating)
                        .opacity(indicatorOpacity)
                    ,alignment: .bottom
                        
                )
                Spacer()
                // Footer
                ZStack{
                    // 1.Background
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    // 2.Call 2 Action
                    Text("Get Started").font(.system(.title3 , design: .rounded))
                        .fontWeight(.bold).offset(x: 20)
                        .foregroundColor(.white)
                    // 3. Capsule
                    HStack {
                        Capsule().fill(Color("ColorRed"))
                            .frame(width: buttonOfset + 80)
                        Spacer()
                    }
                    // 4. Circle
                    HStack {
                        ZStack{
                            Capsule().fill(Color("ColorRed"))
                            Capsule().fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24, weight: .bold))
                                .opacity(isAnimating ? 1 : 0)
                                .animation(.easeOut(duration : 0.5) , value: isAnimating)
                        } .foregroundColor(.white)
                          .frame(width: 80 , height: 80 , alignment: .center)
                          .offset( x: buttonOfset)
                          .gesture(DragGesture()
                            .onChanged {gesture in
                                if gesture.translation.width > 0 && buttonOfset <= buttonWidth - 80 {
                                    buttonOfset = gesture.translation.width
                                }}
                          .onEnded { _ in
                              withAnimation(Animation.easeOut(duration: 0.4)) {
                                  if buttonOfset > buttonWidth / 2 {
                                      hapticFeedback.notificationOccurred(.success)
                                      playSound(sound: "chimeup", type: "mp3")
                                      buttonOfset = buttonWidth - 80
                                      isOnboardingActive = false
                                  } else {
                                      hapticFeedback.notificationOccurred(.warning)
                                      buttonOfset = 0
                                  }
                              }
                          })
                        Spacer()
                    }
                }
                .frame(width: buttonWidth ,height: 80, alignment: .center).padding()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration : 1) , value: isAnimating)
                .offset(y : isAnimating ? 0 : 40)
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
        
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
