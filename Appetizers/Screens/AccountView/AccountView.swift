//
//  AccountView.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 04.06.2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var nameIsFocused: Bool

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .disableAutocorrection(true)
                        .focused($nameIsFocused)
                    
                    TextField("Last Name Name", text: $viewModel.user.lastName)
                        .disableAutocorrection(true)
                        .focused($nameIsFocused)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .focused($nameIsFocused)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthdate,
                               displayedComponents: .date)
                    
                    Button{
                        nameIsFocused = false
                        viewModel.saveChanges()

                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))

            }

            .navigationTitle("🤖 Account")
            }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                   message: alertItem.message,
                   dismissButton: alertItem.dismissButton)
        }
        }
    }


#Preview {
    AccountView()
}
