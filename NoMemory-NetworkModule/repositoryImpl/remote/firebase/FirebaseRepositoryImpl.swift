//
//  FirebaseDataSourceRepositoryImpl.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 23/07/2024.
//

import Foundation

class FirebaseRepositoryImpl: Repository {
    
    private var firestoreInstance = FirebaseConfig().db
    
    func createShoppingList() async throws {
        do {
            let ref = try await firestoreInstance.collection("shopping_list").addDocument(data: [
                "item 4": "Milk",
                "item 5": "Bread",
                "item 6": "Sugar"
            ])
            print("Document added with ID: \(ref.documentID)")
            print("Success: Document added successfully")
        } catch {
            print("Error adding document: \(error)")
        }
    }
    
    func getShoppingList() async throws {
        do {
          let snapshot = try await firestoreInstance.collection("shopping_list").getDocuments()
          for document in snapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
        } catch {
          print("Error getting documents: \(error)")
        }
    }
    
    func updateShoppingList() async throws {
        let washingtonRef = firestoreInstance.collection("shopping_list").document("odxkamy0TXvpV2wYjo6v") // by documentID

        // Set the "capital" field of the city 'DC'
        do {
          try await washingtonRef.updateData([
            "item 4": "New Food"
          ])
          print("Document successfully updated")
        } catch {
          print("Error updating document: \(error)")
        }
    }
    
    func deleteShoppingList() async throws {
        do {
          try await firestoreInstance.collection("shopping_list").document("H1Bkp2ganc2NOq7mXzpf").delete() //by documentId
          print("Document successfully removed!")
        } catch {
          print("Error removing document: \(error)")
        }
    }
    
    
    
}
