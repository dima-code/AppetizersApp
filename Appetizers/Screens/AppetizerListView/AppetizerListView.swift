//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 04.06.2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("🍔 Appetizers")
            }
            .onAppear(){
                viewModel.getAppetizers()
            }
            if viewModel.isLoading{
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }

    }
    

}

#Preview {
    AppetizerListView()
}
