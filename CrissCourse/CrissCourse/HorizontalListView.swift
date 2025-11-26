//
//  HorizontalListView.swift
//  CrissCourse
//
//  Created by Benito Massidda on 23/11/25.
//

import SwiftUI

struct HorizontalListView: View {
    
    let header: String
    let titles: [Title]
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(header)
                .font(.title)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(titles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
                .padding(.horizontal, 10)
            }
            .frame(height: 250)
        }
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString, titles: Title.previewTitles)
}
