//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 11.06.2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject{

    @AppStorage("user") private var UserData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges(){
        guard isValidForm else{return}
        
        do{
            let data = try JSONEncoder().encode(user)
            UserData = data
            alertItem = AlertContext.userSaveSuccess
        } catch{
            alertItem = AlertContext.invalidUserData
        }
        
    }
    
    func retrieveUser() {
        guard let UserData else{return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: UserData)
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else{
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    

}
