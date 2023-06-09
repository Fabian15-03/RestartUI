//
//  CircleGroup.swift
//  RestartUI
//
//  Created by Fabian Gonzales  on 29/05/23.
//

import SwiftUI

struct CircleGroup: View {
    @State var ShapeColor : Color
    @State var ShapeOpacity : Double
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack{
            Circle().stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
                .frame(width: 260 , height: 260 ,alignment: .center)
            
            Circle().stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260 , height: 260 ,alignment: .center)
            }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0 )
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
            
        }
    }
}

struct CircleGroup_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CircleGroup(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
