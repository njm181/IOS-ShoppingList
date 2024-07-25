//
//  FirebaseDataSourceRepositoryImpl.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 23/07/2024.
//

import Foundation

//lo unico que se expone a externos son los repositorios
//al resto que no es public ponerlo protegido
public class FirebaseRepositoryImpl: Repository {
    
    private var firestoreInstance = FirebaseConfig().db
    
    //recibe un mapa, que contiene nombre del producto y cantidad
    func createShoppingList(items: [String: Any], shoppingListName: String) async throws {
        do {
            let ref = try await firestoreInstance.collection(shoppingListName).addDocument(data: items)
            print("Document added with ID: \(ref.documentID)")
            print("Success: Document added successfully")
        } catch {
            print("Error adding document: \(error)")
        }
    }
    
    func getShoppingList(collectionID: String) async throws {
        do {
          let snapshot = try await firestoreInstance.collection(collectionID).getDocuments()
          for document in snapshot.documents {
            print("\(document.documentID) => \(document.data())")
          }
        } catch {
          print("Error getting documents: \(error)")
        }
    }
    
    //recibe un id
    func updateShoppingList(collectionID: String, items: [String: Any], documentID: String) async throws {
        let washingtonRef = firestoreInstance.collection(collectionID).document(documentID)

        do {
          try await washingtonRef.updateData(items)
          print("Document successfully updated")
        } catch {
          print("Error updating document: \(error)")
        }
    }
    
    //recibe un id
    func deleteShoppingList(collectionID: String, documentID: String) async throws {
        do {
          try await firestoreInstance.collection(collectionID).document(documentID).delete()
          print("Document successfully removed!")
        } catch {
          print("Error removing document: \(error)")
        }
    }
    
    
    
}
