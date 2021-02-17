//
//  HomeView.swift
//  newCurio
//
//  Created by user on 2021-02-11.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            
            NewViewAgain()
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.06913527397)), Color.white]), startPoint: .bottom, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color.white)
                
                )
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
