//
//  URLSessionNetworkManager.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

//The URLSessionNetworkManager class is an implementation of the NetworkManager protocol.
//It uses Apple's URLSession to perform network operations. Here's an explanation of the class:

class URLSessionNetworkManager: NetworkManagerProtocol {
    
    static let shared = URLSessionNetworkManager()
    
    func createRequest<T: Decodable>(_ endpoint: EndpointProtocol, responseType: T.Type) async throws -> T {
        //create an HTTP request using the provided endpoint
        let urlRequest = endpoint.makeUrlRequest()
        return try await makeRequest(urlRequest: urlRequest)
    }
    
    private func makeRequest<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let request = try await URLSession.shared.data(for: urlRequest)
        return try validateResponse(request: request)
    }
    
    private func validateResponse<T: Decodable>(
        request: (data: Data, httpResponse: URLResponse)
    ) throws -> T {
        
        guard let httpResponse = request.httpResponse as? HTTPURLResponse
        else {
            throw ApiError.UNKNOWN_ERROR
        }
        
        switch httpResponse.statusCode {
        case HttpResponseStatus.OK:
            return try decodeModel(data: request.data)
        case HttpResponseStatus.CLIENT_ERROR:
            throw ApiError.CLIENT_ERROR
        case HttpResponseStatus.SERVER_ERROR:
            throw ApiError.SERVER_ERROR
        default:
            throw ApiError.UNKNOWN_ERROR
        }
    }
    
    private func decodeModel<T: Decodable>(data: Data) throws -> T {
        let decorder = JSONDecoder()
        let model = try? decorder.decode(T.self, from: data)
        guard let model = model else {
            print("DECODING_ERROR_FROM_URLSESSION_NETWORK_MANAGER")
            throw ApiError.DECODING_ERROR
        }
        return model
    }
    
}
