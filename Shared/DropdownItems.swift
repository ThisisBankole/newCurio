//
//  DropdownItems.swift
//  newCurio
//
//  Created by user on 2021-02-11.
//

import SwiftUI

struct DropdownItems: View {
    var body: some View {
        VStack {
            Spacer()
            VStack {
               MenuItems(title1: "USD", title2: "GBP", title3: "EUR")
               
            }
            .frame(width: 300)
            .frame(height: 150)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
            .padding(.horizontal, 30)
        }
        
    }
}

struct DropdownItems_Previews: PreviewProvider {
    static var previews: some View {
        DropdownItems()
    }
}

struct MenuItems: View {
    var title1: String
    var title2: String
    var title3: String
    var body: some View {
        VStack(spacing: 20.0) {
            Text(title1)
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: 120, alignment:.center)
            Text(title2)
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: 120, alignment:.center)
            Text(title3)
                .font(.system(size: 20, weight: .regular, design: .default))
                .frame(width: 120, alignment:.center)
        }
        
    }
}
