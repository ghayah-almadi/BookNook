//
//  LikeButtonView.swift
//  LoginPage
//
//  Created by Israa Kheder on 25/05/1444 AH.
//

import SwiftUI

struct Like: View {
    @State private var isLiked = false
    var body: some View {
        HeartButton(isLiked: $isLiked)
    }
}
struct HeartButton: View {
    @Binding var isLiked: Bool
    
    private let animationDutartion: Double = 0.1
    private var animationSacle : CGFloat {
        isLiked ? 0.7 : 1.3
    }
    @State private var animate = false
    
    var body: some View {
        Button( action: {
            self.animate = true
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDutartion, execute: {
                self.animate = false
                self.isLiked.toggle()
            })
        } ,label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .font(.system(size: 17)).foregroundColor(Color("AC"))
                .foregroundColor(isLiked ? Color("AC") : .white)
                .multilineTextAlignment(.trailing)
            
        })
        .scaleEffect(animate ? animationSacle : 1)
        .animation(.easeIn(duration: animationDutartion))
    }
}
struct LikeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Like()
    }
}
