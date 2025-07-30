//
//  ContentView.swift
//  Utilidades
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    //Vid 304 ,hacemos un place holder, ya que no existe
    @State private var texto = "Escribe aqui..."
    @State private var placeholder = false
    @State private var val = 0
    var body: some View {
        NavigationView{
            TextEditor(text: $texto)
                .font(.title3)
                .opacity(placeholder ? 1 : 0.50 )
                .padding()
                .navigationTitle("Text Editor")
            //si damos click se borra 
                .onTapGesture {
                    placeholder = true
                    if val == 0 {
                        val = 1
                        texto = ""
                    }
                }
        }
    }
}



