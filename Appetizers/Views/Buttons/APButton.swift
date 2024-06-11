//
//  APButton.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 10.06.2024.
//

import SwiftUI

struct APButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color(Color.brandPrimary))
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Title")
}
