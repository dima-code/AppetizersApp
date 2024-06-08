//
//  Appetizer.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 04.06.2024.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
    
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}


struct MockData{
    
    static let sampleAppetizer = Appetizer(id: 0001, name: "Test", description: "Test Description", price: 99.99, imageURL: "", calories: 440, protein: 2, carbs: 5)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
