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
        do {
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie", by: "trending")
            trendingTV = try await dataFetcher.fetchTitles(for: "tv", by: "trending")
            topRatedMovies = try await dataFetcher.fetchTitles(for: "movie", by: "top_rated")
            topRatedTV = try await dataFetcher.fetchTitles(for: "tv", by: "top_rated")
            homeStatus = .success
        }catch{
            homeStatus = .failed(underlyingError: error)
            
        }
    }
    
    
}
