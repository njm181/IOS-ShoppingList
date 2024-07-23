//
//  HttpResponseStatus.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 09/07/2024.
//

import Foundation

enum HttpResponseStatus {
    static let OK = 200...299
    static let CLIENT_ERROR = 400...499
    static let SERVER_ERROR = 500...599
}
