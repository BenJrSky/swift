//
//  ContentView.swift
//  CrissCourse
//
//  Created by Benito Massidda on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    
    

    
    var body: some View {
        TabView{
            Tab(Constants.homeString,systemImage: Constants.homeIconString){
                HomeView()
            }
            Tab(Constants.upcomingString, systemImage: Constants.upcomingIconString){
               
            }
            Tab(Constants.searchString,systemImage: Constants.searchIconString){
                Text("Search")
            }
            Tab(Constants.downloadString,systemImage: Constants.downloadIconString){
                Text("Download")
            }
        }
        .onAppear{
       
            if let confing = APIConfig.shared {
                print(confing.tmdbAPIKey)
            }
           
        }
    }
}

#Preview {
    ContentView()
}
