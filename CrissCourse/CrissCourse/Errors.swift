//
//  Errors.swift
//  CrissCourse
//
//  Created by Benito Massidda on 25/11/25.
//

import Foundation


 
enum APIConfigError: Error, LocalizedError {
    
    
    case fileNotFound
    case dataLoadingFailed(underlyingError:Error)
    case decodingFailed(underlyingError:Error)
    
    
    var errorDescription: String?{
        switch self {
        case .fileNotFound:
            return "File not found"
        case .dataLoadingFailed(underlyingError: let error):
            return "Failed to load data: \(error.localizedDescription)"
        case .decodingFailed(underlyingError: let error):
            return "Failed to decode data: \(error.localizedDescription)"
        }
    }
    
}

enum NetworkError: Error, LocalizedError {
    
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    
    var errorDescription: String?{
        switch self {
            case .badURLResponse(underlyingError: let error):
                return "Bad URL Response: \(error.localizedDescription)"
            case .missingConfig:
                return "Missing Configuration"
            case .urlBuildFailed:
                return "URL Build Failed"
        }
       
        
    }
    
}
