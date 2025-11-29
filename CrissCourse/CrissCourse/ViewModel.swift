//
//  ViewModel.swift
//  CrissCourse
//
//  Created by Benito Massidda on 25/11/25.
//

import Foundation



@Observable

class ViewModel {
    
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed (underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    
    private let dataFetcher = DataFetcher()
    
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitle() async{
        homeStatus = .fetching
        
        if trendingMovies.isEmpty{
            
            do {
                async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
                async let tRatedMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRatedTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedMovies = try await tRatedMovies
                topRatedTV = try await tRatedTV
                
                homeStatus = .success
            }catch{
                homeStatus = .failed(underlyingError: error)
                
            }
            
        }else{
            homeStatus = .success
        }
            
            
        
        
        
    }
    
    
}
