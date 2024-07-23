//
//  NetworkManagerProtocol.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

//The NetworkManager protocol defines a method for sending HTTP requests
//and receiving responses asynchronously. Here's a brief overview of the protocol:

protocol NetworkManagerProtocol {
    func createRequest<T: Decodable>(
        _ endpoint: EndpointProtocol,
        responseType: T.Type
    ) async throws -> T
}

//createRequest: his method sends an HTTP request using the provided EndpointProtocol
//and expects a response of a specified type T.
//It uses Swift's async/await for asynchronous execution and can throw errors in case of failures.
