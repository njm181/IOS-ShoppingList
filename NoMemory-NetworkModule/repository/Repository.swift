//
//  FirebaseRepository.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 22/07/2024.
//

import Foundation

protocol Repository {
    
    func createShoppingList(items: [String: Any], shoppingListName: String) async throws
    
    func getShoppingList(collectionID: String) async throws
    
    func deleteShoppingList(collectionID: String, documentID: String) async throws
    
    func updateShoppingList(collectionID: String, items: [String: Any], documentID: String) async throws
}
