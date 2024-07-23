//
//  ApiResponse.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    let status: ApiResponseStatus?
    let message: String?
    let data: T?
}

enum ApiResponseStatus: String, Codable {
    case SUCCESS = "SUCCESS"
    case ERROR = "ERROR"
    case CLIENT_ERROR = "CLIENT_ERROR"
    case UNKNOWN_ERROR = "UNKNOWN_ERROR"
    case SERVER_ERROR = "SERVER_ERROR"
    case URL_ERROR = "URL_ERROR"
    case DECODING_ERROR = "DECODING_ERROR"
    case GENERIC_ERROR = "GENERIC_ERROR"
    case CREATE_REQUEST_ERROR = "CREATE_REQUEST_ERROR"
}
