//
//  AlertText.swift
//  Utilidades
//
//  Created by Paul Jaime Felix Flores on 29/07/24.
//

import SwiftUI
//Vid 309
struct AlertText: View {
    
    @State private var texto = ""
    
    var body: some View {
        VStack(alignment: .center){
            Button {
                //Mandamos a llamar nuestra alerta 
                alertText(title: "Titulo", message: "Mensaje", hintText: "placeholder", primaryButton: "Aceptar", cancelButton: "Cancelar") { string in
                    texto = string
                } cancelAction: { _ in
                    
                }

            } label: {
                Text("Alerta texfield")
            }
            Text(texto)
        }
    }
}
//Hacemos una extension a la vista
extension View {
    //Tenemos el titulo ,el mensaje ..
    //(String) -> (), es el texto que vamos a escribir
    func alertText(title: String, message: String, hintText: String, primaryButton: String, cancelButton: String, primaryAction: @escaping (String) -> (), cancelAction: @escaping (String) -> () ){
        
        //Funcion de la alerta
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { field in
            field.placeholder = hintText
        }
        //Agregamos la accion
        alert.addAction(.init(title: primaryButton, style: .default, handler: { _ in
            if let text = alert.textFields?[0].text?.uppercased() {
                primaryAction(text)
            }else{
                primaryAction("")
            }
        }))
        
        alert.addAction(.init(title: cancelButton, style: .destructive, handler: { _ in
            
        }))
        
        rootController().present(alert, animated: true, completion: nil)
        
    }
    //Funcion para retornarnos la vista
    func rootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init() }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
    
    
}
