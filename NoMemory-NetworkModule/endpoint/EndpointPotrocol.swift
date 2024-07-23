//
//  EndpointPotrocol.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

//This protocol defines the structure for creating network request endpoints.
//It includes properties like baseURL, path, method, header, queryParams,
//and multipartFormData, allowing you to specify various details of an API endpoint.

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension EndpointProtocol {
    
    func makeUrlRequest() -> URLRequest {
        
        guard var components = URLComponents(string: baseUrl) else { fatalError("Invalid base URL") }
        
        //Add path
        components.path += path
        print(components.url ?? "Url is empty")
        
        //Create request
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        return request
    }
}
