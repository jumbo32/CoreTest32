//
//  CellFormatLight.swift
//  CoreTest32
//
//  Created by A Bridge on 3/9/22.
//
import SwiftUI

struct CellFormatLight: ViewModifier {
    func body(content: Content) -> some View {
        content
            //.padding(.horizontal, 1.0)
            .padding(.vertical, 4.0)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(Color.white)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0.5)
            .multilineTextAlignment(.center)
            .font(.subheadline)
    }
}
