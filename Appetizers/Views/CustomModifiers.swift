//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Dmitrii Eselidze on 14.06.2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}
