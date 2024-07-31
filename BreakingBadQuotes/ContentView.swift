//
//  ContentView.swift
//  BreakingBadQuotes
//
//  Created by Swapnil Chatterjee on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FetchView(show: Constants.bbName)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label(Constants.bbName,systemImage: "tortoise")
                }
            FetchView(show: Constants.bcsName)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                Label(Constants.bcsName,systemImage: "briefcase")
            }
            FetchView(show: Constants.ecName)
                 .toolbarBackground(.visible, for: .tabBar)
                 .tabItem {
                     Label( Constants.ecName,systemImage: "car")
                 }
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
