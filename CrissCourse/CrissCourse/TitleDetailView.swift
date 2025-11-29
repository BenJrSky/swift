//
//  TitleDetailView.swift
//  CrissCourse
//
//  Created by Benito Massidda on 29/11/25.
//

import SwiftUI


struct TitleDetailView: View {
    
    let title:Title
    
    
    var body: some View {
    
        GeometryReader { geo in
            
            
            ScrollView{
                LazyVStack(alignment: .leading){
                    AsyncImage(url: URL(string: title.posterPath ?? "")){
                        image in
                        
                        image
                            .resizable()
                            .scaledToFit()
                        
                    }placeholder: {
                        ProgressView()
                    }
                }.frame(width: geo.size.width, height: geo.size.height*0.85)
                
                Text(title.name ?? title.title ?? "")
                    .bold()
                    .font(.title2)
                    .padding(5)
                    .padding(.top, -20)
                
                Text(title.overview ?? "No overview available")
                    .font(.body)
                    .padding(5)
                
            }
            
        }
        
        
    }
}


#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
