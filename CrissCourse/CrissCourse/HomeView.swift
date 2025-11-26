//
//  HomeView.swift
//  CrissCourse
//
//  Created by Benito Massidda on 23/11/25.
//

import SwiftUI


struct HomeView: View {
    
    
    var heroTestTitle = Constants.testTitleURL
    
    let viewModel = ViewModel()
    
    
    var body: some View {
        
        
        GeometryReader {
            
            geo in
            
            
            ScrollView {
                
                
                switch viewModel.homeStatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                    case .success:
                    
                        LazyVStack{
                            AsyncImage(url: URL(string: heroTestTitle)){
                                image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                   
                            }placeholder: {
                                ProgressView()
                            }
                            //stessa dimensione dello screen
                            .frame(width: geo.size.width,height: geo.size.height*0.85)
                            
                            HStack{
                                Button{
                                    
                                }label: {
                                    Text(Constants.playString)
                                        .ghostButton()
                                }
                                
                                Button{
                                    
                                }label: {
                                    Text(Constants.downloadString)
                                        .ghostButton()
                                }
                            }
                            
                            HorizontalListView(header: Constants.trendingMovieString, titles: viewModel.trendingMovies)
                            HorizontalListView(header: Constants.treadingTVString, titles: viewModel.trendingTV)
                            HorizontalListView(header: Constants.topRatedMoviesString, titles: viewModel.topRatedMovies)
                            HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTV)
                      }
                    
                case .failed(let error):
                    Text(String(describing: error))
                }
                
                
                
        
            }.task {
                await viewModel.getTitle()
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
