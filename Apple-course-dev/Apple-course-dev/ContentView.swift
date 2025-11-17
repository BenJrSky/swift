//
//  ContentView.swift
//  Apple-course-dev
//
//  Created by Benito Massidda on 14/11/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        
        var myText:Text{
            Text("Ciao, mondo!")
        }
        
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            myText
            
            HStack{
                Text("A")
                Text("B")
                Text("C")
            }
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
