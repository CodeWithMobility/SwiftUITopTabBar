//
//  ContentView.swift
//  SwiftUITopTabLayout
//
//  Created by Manu Aravind on 11/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedValue: Int = 0
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    TopMenuBar(width: geometry.size.width,
                               selectedTextColor: .primary,
                               normalTextColor: .primary.opacity(0.6),
                               lineColor: .red,
                               selectedValue: $selectedValue)
                    
                    // Display the selected view based on the selectedValue
                    selectedView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.gray.opacity(0.1))
                }
            }
        }
    }
    
    // A function to switch views based on the selected tab
    @ViewBuilder
    private func selectedView() -> some View {
        switch selectedValue {
        case 0:
            TrendingView()
        case 1:
            GenresView()
        case 2:
            ArtistsView()
        default:
            AlbumsView()
        }
    }
}

#Preview {
    ContentView()
}
