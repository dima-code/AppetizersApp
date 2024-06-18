//
//  appetizerListViewModel.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 05.06.2024.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject{
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizers { [self] result in
//            DispatchQueue.main.async{ [self] in
//                isLoading = false
//                switch result{
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error{
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }

    func getAppetizers(){
        isLoading = true
        
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch{
                if let apError = error as? APError{
                    switch apError{
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else{
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}



