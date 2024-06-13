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
    
    static let sampleAppetizer = Appetizer(id: 0001, name: "Some Food", description: "This is a multiline text description of product", price: 99.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 440, protein: 2, carbs: 5)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    
    static let orderItemOne = Appetizer(id: 0001, name: "Some Food One", description: "This is a multiline text description of product", price: 99.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 440, protein: 2, carbs: 5)
    
    static let orderItemTwo = Appetizer(id: 0002, name: "Some Food Two", description: "This is a multiline text description of product", price: 99.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 440, protein: 2, carbs: 5)
    
    static let orderItemThree = Appetizer(id: 0003, name: "Some Food Three", description: "This is a multiline text description of product", price: 99.99, imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", calories: 440, protein: 2, carbs: 5)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
    
}
