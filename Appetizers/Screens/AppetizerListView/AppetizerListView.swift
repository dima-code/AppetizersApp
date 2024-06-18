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
//                        .listRowSeparator(.hidden)
                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("🍔 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .task{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
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
