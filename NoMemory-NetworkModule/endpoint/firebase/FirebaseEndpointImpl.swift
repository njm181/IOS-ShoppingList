//
//  EndpointImplementation.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

//create an enum implementing the EndpointProtocol to define your API endpoints

enum FirebaseEndpointsImpl {
    case getShoppingList
    case saveShoppingItem
}

extension FirebaseEndpointsImpl: EndpointProtocol {
    var baseUrl: String {
        "https://api.mockfly.dev/mocks/a2e39d35-6f55-418c-a234-ed4569485b53"
    }
    
    var path: String {
        switch self {
        case .getShoppingList:
            return "/shopping-list"
        case .saveShoppingItem:
            return "/shopping-item"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getShoppingList:
            return .GET
        case .saveShoppingItem:
            return .POST
        }
    }
    
    
    
}
