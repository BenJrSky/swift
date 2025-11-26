//
//  APIConfig.swift
//  CrissCourse
//
//  Created by Benito Massidda on 23/11/25.
//

import Foundation

struct APIConfig:Decodable{
    
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared: APIConfig? = {
        
        do {
            return try loadingConfig()
        }catch{
            print("Failed to load API config \(error)")
            return nil
        }
  
    }()
    
    private static func loadingConfig() throws -> APIConfig {
        
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            throw APIConfigError.fileNotFound
        }
    
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(APIConfig.self, from: data)
        }catch let error as DecodingError{
            throw APIConfigError.decodingFailed(underlyingError: error)
        }catch {
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
        
        
        
        
    }
}


