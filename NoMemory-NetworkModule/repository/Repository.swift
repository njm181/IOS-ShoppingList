//
//  FirebaseRepository.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 22/07/2024.
//

import Foundation

protocol Repository {
    
    func createShoppingList() async throws
    
    func getShoppingList() async throws
    
    func deleteShoppingList() async throws
}
