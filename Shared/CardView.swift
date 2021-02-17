//
//  CardView.swift
//  newCurio
//
//  Created by user on 2021-02-11.
//

import SwiftUI

struct NewViewAgain: View {
    @State var showPicker = false
   @State var amount: CGFloat = 00
   @State var price = 00
    
    
    var body: some View {
        
        
            
        ZStack {
            Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 0.5))
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                    VStack(alignment: .center, spacing: 50) {
                        HStack{
                            Image(uiImage: #imageLiteral(resourceName: "curio - logo"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            Spacer()
                        }
                        .padding(.leading, 40)
                        .offset(y:30)
                        
                        
                        Text("Curio - Your personal currency converter")
                            .font(.system(size: 18, weight: .light))
                            .offset(y: 70)
                        HStack(spacing: 15.0) {
                            Text("NGN")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.white)
                                .frame(width: 82, height: 69)
                                .background(Color.black)
                                .cornerRadius(5)
                            TextField("Enter Amount",
                                      value: $price,
                                      formatter: NumberFormatter.currency,
                                      onEditingChanged: { _ in print("changed") },
                                      onCommit: { print("commit") }
                                      

                            )
                            .textFieldStyle(SuperCustomTextFieldStyle())
                            
                            
                                
                    
                        }
                        .offset(y: 90)
                        
                        VStack {
                            PickerView(showPicker: $showPicker)
                        }
                        
                        ForEach (sectionData) { item in
                            GeometryReader { geomery in
                                
                                NewCardView(section: item)
                                
                            }
                            .frame(width: 301, height: 75, alignment: .center)
                            .offset(y: 90)
                            
                        }
                        
                    }
                DropdownItems()
                    .offset(y: showPicker ? -400 : screen.height)
                    .animation(.spring(response: 0.9, dampingFraction: 0.8, blendDuration: 0))
                    .onTapGesture {
                        self.showPicker.toggle()
                    }
                
                    
            }
            
        }
            
        }
        
        
        
        
    }
    


struct NewViewAgain_Previews: PreviewProvider {
    static var previews: some View {
        NewViewAgain()
    }
}

struct NewCardView: View {
    var section: Section
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 35.0) {
                Text(section.title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                Text("\(section.text,specifier:"%.2f")")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.white)
            }
            .frame(width: 301, height: 75)
            .background(
                LinearGradient(gradient: Gradient(colors: [section.color2, section.color1]), startPoint: .bottomLeading, endPoint: .bottomTrailing)
            )
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: section.color3.opacity(0.3), radius: 10, x: 0, y: 10)
        }
    }
}
struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: Double
    var color1: Color
    var color2: Color
    var color3: Color
}

let sectionData = [
    
    Section(title: "USD", text: 500, color1: Color(#colorLiteral(red: 0.4470588235, green: 0.9294117647, blue: 0.9490196078, alpha: 1)), color2: Color(#colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.8980392157, alpha: 1)), color3: Color (#colorLiteral(red: 0.3176470588, green: 0.3176470588, blue: 0.8980392157, alpha: 1))),
    Section(title: "GBP", text: 450, color1: Color(#colorLiteral(red: 0.737254902, green: 0.4705882353, blue: 0.9254901961, alpha: 1)), color2: Color(#colorLiteral(red: 0.231372549, green: 0.1490196078, blue: 0.4039215686, alpha: 1)), color3: Color(#colorLiteral(red: 0.737254902, green: 0.4705882353, blue: 0.9254901961, alpha: 1))),
    Section(title: "EUR", text: 900, color1: Color(#colorLiteral(red: 0.968627451, green: 0.3803921569, blue: 0.631372549, alpha: 1)), color2: Color(#colorLiteral(red: 0.5490196078, green: 0.1058823529, blue: 0.6705882353, alpha: 1)), color3: Color(#colorLiteral(red: 0.5490196078, green: 0.1058823529, blue: 0.6705882353, alpha: 1))),
    Section(title: "BTC", text: 900, color1: Color(#colorLiteral(red: 1, green: 0.6666666667, blue: 0.5215686275, alpha: 1)), color2: Color(#colorLiteral(red: 0.7019607843, green: 0.1921568627, blue: 0.3725490196, alpha: 1)), color3: Color(#colorLiteral(red: 0.7019607843, green: 0.1921568627, blue: 0.3725490196, alpha: 1)))

            ]

// 3B2667
// 72EDF2


struct SuperCustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            
            .frame(width: 207, height: 69)
            .border(Color(#colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 0.2621735873)))
            .cornerRadius(5)
            .font(.system(size: 23, weight: .light, design: .rounded))
            .multilineTextAlignment(.center)
            
           
            
    }
}

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.currencySymbol = ""
        formatter.numberStyle = .currency
        return formatter
    }
}
    




struct PickerView: View {
    @Binding var showPicker: Bool
    var body: some View {
        HStack {
            Button(action:{self.showPicker.toggle()} ) {
            Text("Select Currency")
                .font(.system(size: 14))
            Image(systemName: "chevron.down")
                .font(.system(size: 15, weight: .light))
                .imageScale(.large)
                .frame(width: 20, height: 20)
        }
        .foregroundColor(.black)
        .frame(width: 301, height: 50)
        .border(Color.gray, width: 0.5)
        .cornerRadius(2)
        .offset(y: 90)
    }
 }
}

let screen = UIScreen.main.bounds
