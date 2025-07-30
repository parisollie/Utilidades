//
//  LimitText.swift
//  Utilidades
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI

struct LimitText: View {
    //Vid 306
    @StateObject var limitModel = LimitViewModel()
    @State private var show = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                TextField("Escribe aqui...", text: $limitModel.texto)
                    .padding(.all, 15)
                    .border(Color.blue)
                    .font(.title3)
                //si se paso ponlo a color rojo
                    .foregroundColor(limitModel.limitColor ? Color.red : Color.black )
                    .navigationTitle("Limitar TextField")
                //Boton para pasarlo a la siguiente vista 
                Button {
                    show.toggle()
                } label: {
                    Text("enviar")
                }
                .disabled(limitModel.limitColor)
                .sheet(isPresented: $show) {
                    Detalle(texto: limitModel.texto)
                }

            }
        }
    }
}

//Vid 306
class LimitViewModel : ObservableObject {
    
    //La cantidad de caracteres que quiero limitar
    var limit = 10
    // cuando cambie de color para poner que ya se paso
    @Published var limitColor = false
    @Published var texto : String = "" {
        
        didSet {
            if texto.count > limit {
                texto = String(texto.prefix(limit))
                limitColor = true
            }else {
                limitColor = false
            }
        }
        
    }
    
}

struct Detalle: View {
    var texto : String
    var body: some View {
        Text(texto)
    }
}

