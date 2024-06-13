//
//  OrderView.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 04.06.2024.
//

import SwiftUI

struct OrderView: View {
    
    @State private var orderItems = MockData.orderItems
    var chosenMeals: [Appetizer] = []
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(orderItems){appetizer in
                        AppetizerListCell(appetizer: appetizer)
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                
                Button{
                    print("order placed")
                } label: {
                    APButton(title: "99.99 - Place Order")
                }
                .padding(.bottom, 25)
            }
                .navigationTitle("🧾 Orders")
        }
    }
    func deleteItems(at offessets: IndexSet){
        orderItems.remove(atOffsets: offessets)
    }
}

#Preview {
    OrderView()
}
