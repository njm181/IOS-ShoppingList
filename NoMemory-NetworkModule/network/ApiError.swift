//
//  ApiError.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

enum ApiError: Error {
    case CLIENT_ERROR
    case SERVER_ERROR
    case UNKNOWN_ERROR
    case URL_ERROR
    case DECODING_ERROR
}

extension ApiError: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
        case .CLIENT_ERROR:
            return NSLocalizedString("CLIENT_ERROR_DESCRIPTION", comment: "")
        case .SERVER_ERROR:
            return NSLocalizedString("SERVER_ERROR_DESCRIPTION", comment: "")
        case .UNKNOWN_ERROR:
            return NSLocalizedString("UNKNOWN_ERROR_DESCRIPTION", comment: "")
        case .URL_ERROR:
            return NSLocalizedString("URL_ERROR_DESCRIPTION", comment: "")
        case .DECODING_ERROR:
            return NSLocalizedString("DECODING_ERROR_DESCRIPTION", comment: "")
        }
    }
}
