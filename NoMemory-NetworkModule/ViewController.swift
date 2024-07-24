//
//  ViewController.swift
//  NoMemory-NetworkModule
//
//  Created by Nico Molina on 04/07/2024.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Analytics.logEvent("InitScreen", parameters: ["message":"Integration"])
        
        let repoImpl = FirebaseRepositoryImpl()
        Task {
            try await repoImpl.updateShoppingList()
        }
        
    }
    


}


