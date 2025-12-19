//
//  Professor.swift
//  103-Project
//
//  Created by Jay Chestnut on 12/18/25.
//

import Foundation

class Professor: Identifiable {
    let id = UUID()
    
    var name: String
    var lastName: String
    var phone: String
    
    init(name: String, lastName: String, phone: String){
        self.name = name
        self.lastName = lastName
        self.phone = phone
    }
}
