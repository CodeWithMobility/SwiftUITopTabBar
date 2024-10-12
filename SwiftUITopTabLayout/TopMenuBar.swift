//
//  TopMenuBar.swift
//  SwiftUITopTabLayout
//
//  Created by Manu Aravind on 11/10/24.
//

import SwiftUI

public struct TopMenuBar: View {
   
    var width: CGFloat
    var selectedTextColor: Color
    var normalTextColor: Color
    var lineColor: Color
    
    @Binding var selectedValue: Int
    
    @State private var lineOffset: CGFloat = 0
    
    let stringArray = ["Trending", "Genres", "Artists", "Albums"]
    let offsetSpacing: CGFloat = 8
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) { // No spacing to fill up max space
                ForEach(stringArray.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            self.selectedValue = index
                            self.lineOffset = CGFloat(index) * (width / CGFloat(stringArray.count))
                        }
                    }) {
                        Text(stringArray[index])
                            .font(.system(size: 16))
                            .foregroundColor(selectedValue == index ? selectedTextColor : normalTextColor)
                            .frame(maxWidth: .infinity) // Ensures equal width
                        // Add padding if needed
                    }.frame(height: 50)
                }
            }
            .frame(maxWidth: .infinity).offset(y: offsetSpacing)
          
            HStack(spacing: 0) {
                lineColor
                    .frame(width: width / CGFloat(stringArray.count), height: 3)
                    .offset(x: CGFloat(selectedValue) * (width / CGFloat(stringArray.count)))
                Spacer()
            }.frame(height: 3).offset(y:offsetSpacing)
            Divider().offset(y: offsetSpacing)
        }.background(.white)
    }
}
