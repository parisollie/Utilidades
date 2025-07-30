//
//  Vibracion.swift
//  Utilidades
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
//Vid 304 ,para que el boton vibre 
struct Vibracion: View {
    var body: some View {
        Button {
            let impacto = UIImpactFeedbackGenerator(style: .light)
            impacto.impactOccurred()
        } label: {
            Text("Vibrar")
        }

    }
}
