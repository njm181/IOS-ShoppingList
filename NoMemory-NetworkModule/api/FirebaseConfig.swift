//
//  FirebaseConfig.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 23/07/2024.
//

import Foundation
import FirebaseFirestore

struct FirebaseConfig {
    public let db = Firestore.firestore()
}
