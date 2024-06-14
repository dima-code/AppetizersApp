//
//  Order.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 14.06.2024.
//

import Foundation

final class Order: ObservableObject{
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0){$0 + $1.price}
    }
    
    func add (_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems(at offessets: IndexSet){
        items.remove(atOffsets: offessets)
    }
}
